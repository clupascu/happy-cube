$:.unshift File.expand_path('..', __FILE__)

require 'happy_cube'

# See piece.rb for an explanation of how Pieces are constructed
pieces = [
  HappyCube::Piece.new([0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1]),
  HappyCube::Piece.new([0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0]),
  HappyCube::Piece.new([0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0]),
  HappyCube::Piece.new([0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1, 0, 1, 1, 0, 1]),
  HappyCube::Piece.new([0, 0, 1, 0, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 0, 1]),
  HappyCube::Piece.new([0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 0, 1])
]

solver = HappyCube::Solver.new(pieces)

puts solver.solve