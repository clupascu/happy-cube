require 'test_helper'

module HappyCube
  class TestPiece < Minitest::Test
    def test_can_create
      Piece.new([
        '  A  ',
        ' AAA ',
        'AAAAA',
        ' AAA ',
        'AAA  '])
    end

    def test_fails_if_row_is_shorter
      third_row_shorter = [
        '  A  ',
        ' AAA ',
        'AAAA',
        ' AAA ',
        'AAA  ']

      ex = assert_raises(InvalidPieceError) do
        Piece.new third_row_shorter
      end
      assert_equal 'Illegal row size', ex.message
    end

    def test_fails_if_row_is_longer
      third_row_longer = [
        '  A  ',
        ' AAA ',
        'AAAAAA',
        ' AAA ',
        'AAA  ']

      ex = assert_raises(InvalidPieceError) do
        Piece.new third_row_longer
      end
      assert_equal 'Illegal row size', ex.message
    end

    def test_fails_if_less_rows_than_expected
      third_row_longer = [
        '  A  ',
        ' AAA ',
        'AAAAA',
        'AAA  ']

      ex = assert_raises(InvalidPieceError) do
        Piece.new third_row_longer
      end
      assert_equal 'Illegal row count', ex.message
    end

    def test_fails_if_more_rows_than_expected
      third_row_longer = [
        '  A  ',
        ' AAA ',
        'AAAAA',
        ' AAA ',
        ' AAA ',
        'AAA  ']

      ex = assert_raises(InvalidPieceError) do
        Piece.new third_row_longer
      end
      assert_equal 'Illegal row count', ex.message
    end
  end
end