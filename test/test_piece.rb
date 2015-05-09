require 'test_helper'

module HappyCube
  class TestPiece < Minitest::Test
    def test_can_create_specifying_the_edges
      p = Piece.new([0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1])

      assert_equal [
        [0, 1, 0, 1, 0],
        [1, 1, 1, 1, 0],
        [0, 1, 1, 1, 1],
        [1, 1, 1, 1, 0],
        [1, 0, 1, 0, 0]
      ], p.rows
    end

    def test_validates_edges_are_not_nil
      err = assert_raises(InvalidPieceError) do
        Piece.new(nil)
      end
      assert_equal 'Edges cannot be nil', err.message
    end

    def test_fails_if_edges_too_short
      err = assert_raises(InvalidPieceError) do
        Piece.new([])
      end
      assert_equal 'Invalid edge length. Must be 16.', err.message
    end

    def test_fails_if_edges_too_long
      err = assert_raises(InvalidPieceError) do
        Piece.new([1] * 17)
      end
      assert_equal 'Invalid edge length. Must be 16.', err.message
    end

    def test_string_representation
      p = Piece.new([0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1])

      assert_equal(
        " @ @ \n" \
        "@@@@ \n" \
        " @@@@\n" \
        "@@@@ \n" \
        "@ @  ", 
        p.to_s)
    end
  end
end
