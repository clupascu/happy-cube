module HappyCube
  CUBE_SIZE = 5

  # Base Exception
  class Error < RuntimeError
  end
end

require 'piece'
require 'rotated_piece'
require 'board'
require 'solver'
