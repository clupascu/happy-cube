require 'test_helper'

module HappyCube
  class TestSolver < Minitest::Test
    def test_can_solve
      pieces = [
        Piece.new([0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1]),
        Piece.new([0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0]),
        Piece.new([1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0]),
        Piece.new([0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0]),
        Piece.new([0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0]),
        Piece.new([0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1])
      ]

      solver = Solver.new(pieces)
      assert solver.solve
    end

    def test_unsolvable_problem
      full_pieces = (0...6).map{ |_| Piece.new([1] * 16) }
      solver = Solver.new full_pieces
      refute solver.solve
    end

    def test_ad_hoc_solver
      pieces = [
        Piece.new([0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1]),
        Piece.new([0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0]),
        Piece.new([0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0]),
        Piece.new([0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1]),
        Piece.new([0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1]),
        Piece.new([0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1])
      ]

      solver = Solver.new(pieces)
      puts
      puts solver.solve
    end
  end
end
