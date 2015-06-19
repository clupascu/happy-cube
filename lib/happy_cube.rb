module HappyCube
  CUBE_SIZE = 5

  # Base Exception
  class Error < RuntimeError
  end
end

require 'happy_cube/version'
require 'happy_cube/piece'
require 'happy_cube/rotated_piece'
require 'happy_cube/board'
require 'happy_cube/solver'