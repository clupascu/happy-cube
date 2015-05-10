test_dir = File.dirname(__FILE__)
lib_dir = "#{test_dir}/../lib"

$LOAD_PATH.unshift lib_dir

require 'happy_cube'
require 'piece'
require 'rotated_piece'
require 'board'

module HappyCube
  module PrintablePiece
    def to_s(join_char = '')
      @rows.map do |row|
        row.map { |c| c == 1 ? '@' : ' ' }.join
      end.join join_char
    end
  end

  class Piece
    include PrintablePiece
  end

  class RotatedPiece
    include PrintablePiece
  end
end
