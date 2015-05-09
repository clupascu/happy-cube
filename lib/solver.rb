module HappyCube
  class Solver
    def initialize(pieces)
      @pieces = pieces
      @board = Board.new
    end

    POSITIONS = [:center, :west, :north, :south, :east, :far_east]

    def solve
      @board.place(@pieces[0], :center)
      place_next_pieces
    end

    private

    def place_next_pieces
      return if board.is_full

      position_to_fill = POSITIONS[board.count]

      for piece in get_available_pieces
        for rotated_piece in piece.get_rotations
          @board.place(rotated_piece, position_to_fill)
          place_next_pieces
        end
      end
    end
  end
end
