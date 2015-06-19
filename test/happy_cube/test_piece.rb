require 'test_helper'

module HappyCube
  class TestPiece < Minitest::Test
    def setup
      @p = Piece.new([0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1])
    end

    def test_can_create_specifying_the_edges
      assert_equal [
        [0, 1, 0, 1, 0],
        [1, 1, 1, 1, 0],
        [0, 1, 1, 1, 1],
        [1, 1, 1, 1, 0],
        [1, 0, 1, 0, 0]
      ], @p.rows
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
      assert_equal(
        ' @ @ ' \
        '@@@@ ' \
        ' @@@@' \
        '@@@@ ' \
        '@ @  ', 
        @p.to_s)
    end


    # [0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1]

    def test_top_edge_enumerated_left_to_right
      assert_equal [0, 1, 0, 1, 0], @p.edge(:top)
    end

    def test_bottom_edge_enumerated_left_to_right
      assert_equal [1, 0, 1, 0, 0], @p.edge(:bottom)
    end

    def test_left_edge_enumerated_top_to_bottom
      assert_equal [0, 1, 0, 1, 1], @p.edge(:left)
    end

    def test_right_edge_enumerated_top_to_bottom
      assert_equal [0, 0, 1, 0, 0], @p.edge(:right)
    end


    def test_top_left_corner
      assert_equal 0, @p.corner(:top_left)
    end

    def test_top_right_corner
      assert_equal 0, @p.corner(:top_right)
    end
    
    def test_bottom_left_corner
      assert_equal 1, @p.corner(:bottom_left)
    end
    
    def test_bottom_right_corner
      assert_equal 0, @p.corner(:bottom_right)
    end


    def test_can_be_created_using_a_string_instead_of_an_array
      a_piece = Piece.create('0101001000101101')
      assert_equal @p.edges, a_piece.edges
    end
  end
end
