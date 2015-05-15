# -*- coding: utf-8 -*-

module HappyCube
  class Board
    POSITIONS = [:down, :left, :right, :front, :back, :up]

    def initialize
      @pieces = {}
    end

    def empty?
      @pieces.count == 0
    end

    def full?
      @pieces.count == 6
    end
    
    def place_piece(piece, position)
      raise InvalidPlacementError, "Unknown position - [#{position}]" \
        unless POSITIONS.include? position

      @pieces[position] = piece
    end
    
    def remove_piece_from(position)
      @pieces.delete position
    end

    def [](position)
      @pieces[position]
    end

    def get_all_pieces
      @pieces.values
    end

    # Board looks like this: 
    #
    #     +---+
    #     |ba |
    #     |ck |
    #     |   |
    # +---+---+---+---+
    # |le |do |ri |up |
    # |ft |wn |ght|   |
    # |   |   |   |   |
    # +---+---+---+---+
    #     |fr |
    #     |ont|
    #     |   |
    #     +---+
    #
    # #valid? checks if there are any collisions
    # between the edges/corners of adjacent pieces.

    def valid?
      up_piece = @pieces.fetch(:up, Piece.without_edges)
      down_piece = @pieces.fetch(:down, Piece.without_edges)
      front_piece = @pieces.fetch(:front, Piece.without_edges)
      back_piece = @pieces.fetch(:back, Piece.without_edges)
      left_piece = @pieces.fetch(:left, Piece.without_edges)
      right_piece = @pieces.fetch(:right, Piece.without_edges)

      return false if collision?(down_piece.edge(:left), left_piece.edge(:right))
      return false if collision?(down_piece.edge(:right), right_piece.edge(:left))

      return false if collision?(down_piece.edge(:top), back_piece.edge(:bottom))
      return false if collision?(down_piece.edge(:bottom), front_piece.edge(:top))

      return false if collision?(right_piece.edge(:right), up_piece.edge(:left))
      return false if collision?(left_piece.edge(:left), up_piece.edge(:right))

      return false if collision?(left_piece.edge(:left), up_piece.edge(:right))

      return false if collision?(back_piece.edge(:right), right_piece.edge(:top).reverse)
      return false if collision?(back_piece.edge(:top), up_piece.edge(:top).reverse)
      return false if collision?(back_piece.edge(:left), left_piece.edge(:top).reverse)

      return false if collision?(front_piece.edge(:right), right_piece.edge(:bottom).reverse)
      return false if collision?(front_piece.edge(:bottom), up_piece.edge(:bottom).reverse)
      return false if collision?(front_piece.edge(:left), left_piece.edge(:bottom).reverse)

      true
    end

    def to_s
      canvas = (0...13).map{ |_| ' ' * 17 }

      @pieces.each do |pos, piece|
        print_piece canvas, pos, piece
      end

      canvas.join "\n"
    end

    private

    OUTPUT_CHARS = {
      down: '█',
      up: '█',
      left: '░',
      right: '░',
      back: '▒',
      front: '▒',
    }

    def print_piece(canvas, position, piece)
      offset_y, offset_x = get_offset(position)

      char = OUTPUT_CHARS[position]

      piece.rows.each.with_index do |row, y|
        row.each.with_index do |c, x|
          if c == 1
            canvas[y + offset_y][x + offset_x] = char
          end
        end
      end
    end

    def get_offset(position)
      case position
      when :down
        [4, 4]
      when :left
        [4, 0]
      when :right
        [4, 8]
      when :up
        [4, 12]
      when :back
        [0, 4]
      when :front
        [8, 4]
      end
    end

    def collision?(edge1, edge2)
      edge1.zip(edge2).any?{ |a, b| a == 1 && b == 1 }
    end
  end

  class InvalidPlacementError < Error
  end
end
