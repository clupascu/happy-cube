module HappyCube
  class Piece
    def initialize(piece_lines)
      @lines = piece_lines
      validate!
    end

    private

    SIZE = 5

    def validate!
      raise InvalidPieceError, 'Illegal row count' unless @lines.count == SIZE

      @lines.each do |l|
        raise InvalidPieceError, 'Illegal row size' unless l.size == SIZE
      end
    end
  end

  class InvalidPieceError < Error
  end
end