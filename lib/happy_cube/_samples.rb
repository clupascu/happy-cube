$:.unshift File.expand_path('..', __FILE__)

require 'happy_cube'

# Create a piece by specifying its edge configuration:
# 16 characters that can be 0s (gaps) or 1s (filled square)
#
# These should be specified in clockwise order, starting
# from the top left corner.
#
# For examplethe edge configuration:
# 
#  '0101001000101101'
#
# corresponds to this piece:
#
#  █ █
# ████
#  ████
# ████
# █ █
#

cubes = {
  :yellow_green => [
    HappyCube::Piece.create('0010010101010101'),
    HappyCube::Piece.create('0010001011011010'),
    HappyCube::Piece.create('0101001001010010'),
    HappyCube::Piece.create('0010110100101101'),
    HappyCube::Piece.create('0010110110101101'),
    HappyCube::Piece.create('0010001011010101')
  ],

  :pink => [
    HappyCube::Piece.create('0001110110101101'),
    HappyCube::Piece.create('1010010111011101'),
    HappyCube::Piece.create('0101010101010010'),
    HappyCube::Piece.create('1010001000100011'),
    HappyCube::Piece.create('1010001001010001'),
    HappyCube::Piece.create('0110010100100010')
  ],

  :orange => [
    HappyCube::Piece.create('0101001011011010'),
    HappyCube::Piece.create('0101001001010010'),
    HappyCube::Piece.create('0010110100101101'),
    HappyCube::Piece.create('0010001011010010'),
    HappyCube::Piece.create('1101110100100010'),
    HappyCube::Piece.create('1010010101010101'),
  ],

  :green_marble => [
    HappyCube::Piece.create('0101001011011010'),
    HappyCube::Piece.create('0010001000100010'),
    HappyCube::Piece.create('0101001011010010'),
    HappyCube::Piece.create('0101010101011010'),
    HappyCube::Piece.create('0101101001011101'),
    HappyCube::Piece.create('1010001001011101'),
  ],

  :blue_marble => [
    HappyCube::Piece.create('0011001001010101'),
    HappyCube::Piece.create('0011101001100010'),
    HappyCube::Piece.create('0010010101010101'),
    HappyCube::Piece.create('1101100110100001'),
    HappyCube::Piece.create('0100011000100010'),
    HappyCube::Piece.create('1010110011011101'),
  ],

  :violet_marble => [
    HappyCube::Piece.create('0010110011010101'),
    HappyCube::Piece.create('0011000110100011'),
    HappyCube::Piece.create('0110001011100010'),
    HappyCube::Piece.create('0001111001100101'),
    HappyCube::Piece.create('1100010101010001'),
    HappyCube::Piece.create('1010110001100001'),
  ],

  :blue => [
    HappyCube::Piece.create('0010001011011010'),
    HappyCube::Piece.create('0101001001010010'),
    HappyCube::Piece.create('0101001011010010'),
    HappyCube::Piece.create('0010001001010101'),
    HappyCube::Piece.create('1010001011011101'),
    HappyCube::Piece.create('0101010111011010'),
  ],

  :violet_red => [
    HappyCube::Piece.create('0010001101010101'),
    HappyCube::Piece.create('0010001000111010'),
    HappyCube::Piece.create('1101001011011101'),
    HappyCube::Piece.create('1101001000100101'),
    HappyCube::Piece.create('1101010000100101'),
    HappyCube::Piece.create('0100001011011010'),
  ],

  :yellow => [
    HappyCube::Piece.create('1010000111011101'),
    HappyCube::Piece.create('0110001001011100'),
    HappyCube::Piece.create('0101001000110010'),
    HappyCube::Piece.create('1100010111011001'),
    HappyCube::Piece.create('0010000111100101'),
    HappyCube::Piece.create('0110001000100110'),
  ],

  :red => [
    HappyCube::Piece.create('0101001011010011'),
    HappyCube::Piece.create('0010110101010010'),
    HappyCube::Piece.create('1010010110101101'),
    HappyCube::Piece.create('0010001000110101'),
    HappyCube::Piece.create('0010010110101100'),
    HappyCube::Piece.create('1101001000010101'),
  ],

  :red_marble => [
    HappyCube::Piece.create('1010111001011101'),
    HappyCube::Piece.create('0101010001100101'),
    HappyCube::Piece.create('0101001001011100'),
    HappyCube::Piece.create('0001110100010010'),
    HappyCube::Piece.create('1110001001100010'),
    HappyCube::Piece.create('0010001011101100'),
  ],

  :green => [
    HappyCube::Piece.create('0010001011010101'),
    HappyCube::Piece.create('0010001001010010'),
    HappyCube::Piece.create('0010010101010010'),
    HappyCube::Piece.create('0101001011011010'),
    HappyCube::Piece.create('0010010110101101'),
    HappyCube::Piece.create('0101110110101101'),
  ],

  :easy_yellow => [
    HappyCube::Piece.create('0010001011011101'),
    HappyCube::Piece.create('1010001001011101'),
    HappyCube::Piece.create('0101001001010010'),
    HappyCube::Piece.create('0010010100100101'),
    HappyCube::Piece.create('1010001001011101'),
    HappyCube::Piece.create('0010001011011101'),
  ]
}

solver = HappyCube::Solver.new(cubes[:easy_yellow])
puts solver.solve
