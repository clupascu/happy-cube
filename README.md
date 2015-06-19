# happy-cube

A solver for [Happy cubes](http://www.happycube.com/) written in Ruby.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'happy_cube', git: 'https://github.com/clupascu/happy-cube.git'
```

and then execute:

    $ bundle

## Usage

```ruby
puts HappyCube::Solver.new(pieces).solve
```

In order to solve a puzzle, you have to specify the configuration of the six pieces that will make up the cube.

A piece can be created by specifying its edge configuration: 16 characters that can be 0s (gaps) or 1s (filled square), which have to be specified in clockwise order, starting from the top left corner.

For examplethe edge configuration:

```ruby
'0101001000101101'
```

corresponds to this piece:

```
 █ █
████
 ████
████
█ █
```

So, a complete example looks like this:

```ruby
require 'happy_cube'

pieces = [
  HappyCube::Piece.create('0010010101010101'),
  HappyCube::Piece.create('0010001011011010'),
  HappyCube::Piece.create('0101001001010010'),
  HappyCube::Piece.create('0010110100101101'),
  HappyCube::Piece.create('0010110110101101'),
  HappyCube::Piece.create('0010001011010101')
]

solver = HappyCube::Solver.new(pieces)
puts solver.solve
```
