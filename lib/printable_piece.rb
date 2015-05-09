module HappyCube
  module PrintablePiece
    def to_s
      @rows.map do |row|
        row.map { |c| c == 1 ? '@' : ' ' }.join
      end.join "\n"
    end
  end
end