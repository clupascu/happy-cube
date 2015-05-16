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

def create_piece(edge_configuration)
  HappyCube::Piece.new edge_configuration.chars.map &:to_i
end

yellow_green_cube = [
  create_piece('0010010101010101'),
  create_piece('0010001011011010'),
  create_piece('0101001001010010'),
  create_piece('0010110100101101'),
  create_piece('0010110110101101'),
  create_piece('0010001011010101')
]

pink_cube = [
  create_piece('0001110110101101'),
  create_piece('1010010111011101'),
  create_piece('0101010101010010'),
  create_piece('1010001000100011'),
  create_piece('1010001001010001'),
  create_piece('0110010100100010')
]

orange_cube = [
  create_piece('0101001011011010'),
  create_piece('0101001001010010'),
  create_piece('0010110100101101'),
  create_piece('0010001011010010'),
  create_piece('1101110100100010'),
  create_piece('1010010101010101'),
]

green_marble_cube = [
  create_piece('0101001011011010'),
  create_piece('0010001000100010'),
  create_piece('0101001011010010'),
  create_piece('0101010101011010'),
  create_piece('0101101001011101'),
  create_piece('1010001001011101'),
]

blue_marble_cube = [
  create_piece('0011001001010101'),
  create_piece('0011101001100010'),
  create_piece('0010010101010101'),
  create_piece('1101100110100001'),
  create_piece('0100011000100010'),
  create_piece('1010110011011101'),
]

violet_marble_cube = [
  create_piece('0010110011010101'),
  create_piece('0011000110100011'),
  create_piece('0110001011100010'),
  create_piece('0001111001100101'),
  create_piece('1100010101010001'),
  create_piece('1010110001100001'),
]

blue_cube = [
  create_piece('0010001011011010'),
  create_piece('0101001001010010'),
  create_piece('0101001011010010'),
  create_piece('0010001001010101'),
  create_piece('1010001011011101'),
  create_piece('0101010111011010'),
]

violet_red_cube = [
  create_piece('0010001101010101'),
  create_piece('0010001000111010'),
  create_piece('1101001011011101'),
  create_piece('1101001000100101'),
  create_piece('1101010000100101'),
  create_piece('0100001011011010'),
]

yellow_cube = [
  create_piece('1010000111011101'),
  create_piece('0110001001011100'),
  create_piece('0101001000110010'),
  create_piece('1100010111011001'),
  create_piece('0010000111100101'),
  create_piece('0110001000100110'),
]

solver = HappyCube::Solver.new(yellow_cube)
puts solver.solve
