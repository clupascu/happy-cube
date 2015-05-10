module HappyCube
  class RotatedPiece
    def self.get_all_possible_rotations(piece)
      rotations = [*0...4]
      flippings = [true, false]
      rotations.product(flippings).map do |r, f|
        RotatedPiece.new piece, r, f
      end
    end

    def initialize(original_piece, rotation, flipped)
      @original_piece = original_piece

      rotation_amount = flipped ? 5 + rotation * 4 : -4 * rotation

      rotated_edges = original_piece.edges.rotate(rotation_amount)
      rotated_edges.reverse! if flipped
      @rotated_piece = Piece.new(rotated_edges)

      @rows = @rotated_piece.rows
    end

    attr_reader :edges, :rows, :original_piece
  end
end
