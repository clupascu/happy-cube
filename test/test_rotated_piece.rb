require 'test_helper'

module HappyCube
  class TestRotatedPiece < Minitest::Test
    PIECE = Piece.new([0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1])

    def test_no_rotation_looks_like_original_piece
      no_rotation = RotatedPiece.new(PIECE, 0, false)

      assert_equal(
        ' @ @ ' \
        '@@@@ ' \
        ' @@@@' \
        '@@@@ ' \
        '@ @  ', 
        no_rotation.to_s)
    end

    def test_rotated_90_degrees_clockwise
      rotated = RotatedPiece.new(PIECE, 1, false)

      assert_equal(
        '@@ @ ' \
        ' @@@@' \
        '@@@@ ' \
        ' @@@@' \
        '  @  ',
        rotated.to_s)
    end

    def test_rotated_180
      rotated = RotatedPiece.new(PIECE, 1, false)

      assert_equal(
        '@@ @ ' \
        ' @@@@' \
        '@@@@ ' \
        ' @@@@' \
        '  @  ',
        rotated.to_s)
    end

    def test_rotated_270_degrees_clockwise
      rotated = RotatedPiece.new(PIECE, 3, false)

      assert_equal(
        '  @  ' \
        '@@@@ ' \
        ' @@@@' \
        '@@@@ ' \
        ' @ @@',
        rotated.to_s)
    end

    def test_flipped
      flipped = RotatedPiece.new(PIECE, 0, true)

      assert_equal(
        ' @ @ ' \
        ' @@@@' \
        '@@@@ ' \
        ' @@@@' \
        '  @ @', 
        flipped.to_s)
    end

    def test_flipped_and_rotated_90_clockwise
      flipped = RotatedPiece.new(PIECE, 1, true)

      assert_equal(
        '  @  ' \
        ' @@@@' \
        '@@@@ ' \
        ' @@@@' \
        '@@ @ ',
        flipped.to_s)
    end

    def test_get_all_possible_rotations
      rotations = RotatedPiece.get_all_possible_rotations(PIECE)
      assert 8, rotations.count
    end
  end
end
