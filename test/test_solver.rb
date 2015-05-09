require 'test_helper'

module HappyCube
  class TestSolver < Minitest::Test
    PIECES = [
      Piece.new([0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1]),
      Piece.new([0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0]),
      Piece.new([1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0]),
      Piece.new([0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0]),
      Piece.new([0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0]),
      Piece.new([0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1])
    ]

    def todo_test_solve
      # Solver.new(PIECES)
    end
  end
end
