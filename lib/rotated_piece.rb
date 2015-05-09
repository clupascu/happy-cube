require 'printable_piece'

module HappyCube
  class RotatedPiece
    include PrintablePiece

    def initialize(original_piece, rotation, flipped)
      @original_piece = original_piece

      rotation_amount = case flipped
      when false
        -4 * rotation
      when true
        5 + rotation * 4
      end

      rotated_edges = original_piece.edges.rotate(rotation_amount)
      rotated_edges.reverse! if flipped
      @rotated_piece = Piece.new(rotated_edges)

      @rows = @rotated_piece.rows
    end

    attr_reader :edges, :rows, :original_piece
  end
end