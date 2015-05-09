module HappyCube
  class Piece
    # Creates a HappyCube piece, by specifying
    # its edge configuration.
    # Pieces are 5x5 squares, with the middle
    # (3x3 part) filled.
    # The edges are jagged, that's why they are
    # represented using 0s (gaps) abd 1s (filled portion),
    # enumerated in clockwise order starting from the
    # top left corner.
    #
    # For example, a piece whose edges are:
    # [0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 0, 1]
    # can be represented graphically like this:
    #
    #  @ @
    # @@@@
    #  @@@@
    # @@@@
    # @ @
    #
    def initialize(edges)
      validate! edges
      @edges = edges
      @rows = [
        [*@edges[0...CUBE_SIZE]],
        [@edges[15], 1, 1, 1, @edges[5]],
        [@edges[14], 1, 1, 1, @edges[6]],
        [@edges[13], 1, 1, 1, @edges[7]],
        [*@edges[8..12].reverse]
      ]
    end

    attr_reader :edges, :rows

    private

    def validate!(edges)
      fail InvalidPieceError, 'Edges cannot be nil' unless edges
      fail InvalidPieceError,
           'Invalid edge length. Must be 16.' unless edges.count == 16
    end
  end

  class InvalidPieceError < Error
  end
end
