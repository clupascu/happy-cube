require 'test_helper'

module HappyCube
  class TestBoard < Minitest::Test
    def setup
      @empty_piece = Piece.without_edges
      @full_piece = Piece.new([1] * 16)
      @board = Board.new
    end

    def test_initially_it_is_empty
      assert_equal true, @board.empty?
    end

    def test_can_place_a_piece
      @board.place_piece(@empty_piece, :front)
      assert_equal @empty_piece, @board[:front]
    end

    def test_cannot_place_piece_in_invalid_positions
      ex = assert_raises(InvalidPlacementError) do
        @board.place_piece(@empty_piece, :invalid_position)
      end
      assert_equal 'Unknown position - [invalid_position]', ex.message
    end

    def test_no_longer_empty_after_placing_pieces
      @board.place_piece(@empty_piece, :front)
      assert_equal false, @board.empty?
    end

    def test_can_remove_pieces
      @board.place_piece(@empty_piece, :front)
      @board.remove_piece_from(:front)
      assert_nil @board[:front]
    end

    def test_can_get_empty_again
      @board.place_piece(@empty_piece, :front)
      @board.remove_piece_from(:front)
      assert_equal true, @board.empty?
    end

    def test_can_get_empty_again
      @board.place_piece(@empty_piece, :front)
      @board.remove_piece_from(:front)
      assert_equal true, @board.empty?
    end
    
    def test_can_retrieve_placed_pieces
      p1 = Piece.new([0] * 16)
      p2 = Piece.new([0] * 16)

      @board.place_piece(p1, :front)
      @board.place_piece(p2, :back)

      assert_equal [p1, p2], @board.get_all_pieces
    end

    def test_initially_not_full
      assert_equal false, @board.full?
    end

    def test_still_not_full_after_5_pieces_have_been_placed
      @board.place_piece(@empty_piece, :front)
      @board.place_piece(@empty_piece, :back)
      @board.place_piece(@empty_piece, :left)
      @board.place_piece(@empty_piece, :right)
      @board.place_piece(@empty_piece, :up)
      assert_equal false, @board.full?
    end

    def test_it_is_only_full_after_6_pieces_have_been_placed
      assert_equal false, @board.full?
      @board.place_piece(@empty_piece, :front)
      assert_equal false, @board.full?
      @board.place_piece(@empty_piece, :back)
      assert_equal false, @board.full?
      @board.place_piece(@empty_piece, :left)
      assert_equal false, @board.full?
      @board.place_piece(@empty_piece, :right)
      assert_equal false, @board.full?
      @board.place_piece(@empty_piece, :up)
      assert_equal false, @board.full?
      @board.place_piece(@empty_piece, :down)
      assert_equal true, @board.full?
    end

    def test_initially_it_is_valid
      assert_equal true, @board.valid?
    end

    def test_after_placing_one_piece_still_valid
      @board.place_piece(@empty_piece, :front)
      assert_equal true, @board.valid?
    end

    def test_detects_collision_down_with_left
      @board.place_piece(@full_piece, :down)
      @board.place_piece(@full_piece, :left)
      assert_equal false, @board.valid?
    end

    def test_detects_collision_down_with_right
      @board.place_piece(@full_piece, :down)
      @board.place_piece(@full_piece, :right)
      assert_equal false, @board.valid?
    end


    def test_string_representation_of_empty_board
      assert_equal \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 ", @board.to_s
    end

    def test_string_representation_with_one_piece_down
      piece = Piece.new([0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1])
      @board.place_piece(piece, :down)

      assert_equal \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "     @ @         \n" \
        "    @@@@@        \n" \
        "     @@@         \n" \
        "    @@@@@        \n" \
        "     @ @         \n" \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 ", @board.to_s
    end

    def test_string_representation_with_one_piece_up
      piece = Piece.new([0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1])
      @board.place_piece(piece, :up)

      assert_equal \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "             # # \n" \
        "            #####\n" \
        "             ### \n" \
        "            #####\n" \
        "             # # \n" \
        "                 \n" \
        "                 \n" \
        "                 \n" \
        "                 ", @board.to_s
    end
  end
end
