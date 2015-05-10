$:.unshift File.expand_path('..', __FILE__)

require 'happy_cube'

# See piece.rb for an explanation of how Pieces are constructed

yellow_green_cube = [
  HappyCube::Piece.new([0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1]),
  HappyCube::Piece.new([0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0]),
  HappyCube::Piece.new([0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0]),
  HappyCube::Piece.new([0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1]),
  HappyCube::Piece.new([0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1]),
  HappyCube::Piece.new([0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1])
]

pink_cube = [
  HappyCube::Piece.new([0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1]),
  HappyCube::Piece.new([1, 0, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1]),
  HappyCube::Piece.new([0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0]),
  HappyCube::Piece.new([1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1]),
  HappyCube::Piece.new([1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1]),
  HappyCube::Piece.new([0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0])
]

solver = HappyCube::Solver.new(pink_cube)
puts solver.solve