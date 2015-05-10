module HappyCube
  class Solver
    def initialize(pieces)
      @pieces = pieces
      @board = Board.new
    end

    POSITIONS = [:down, :left, :right, :front, :back, :up]

    attr_reader :board

    def solve
      # First piece is not rotated
      first_piece = RotatedPiece.new(@pieces[0], 0, false)
      @board.place_piece(first_piece, :down)
      place_piece(1)
    end

    private

    def place_piece(level)
      return true if @board.full?

      position_to_fill = POSITIONS[level]

      for piece in get_available_pieces
        for rotated_piece in RotatedPiece.get_all_possible_rotations(piece)
          @board.place_piece(rotated_piece, position_to_fill)

          if @board.valid?
            return true if place_piece(level + 1)
          else
            @board.remove_piece_from(position_to_fill)
          end
        end
      end

      false
    end

    def get_available_pieces
      @pieces - @board.get_all_pieces.map{ |rp| rp.original_piece }
    end
  end
end
