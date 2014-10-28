# Toy Robot

A toy robot that can be placed on a table top, move across it, rotate and report its position.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'toy_robot', :git => 'https://github.com/maleckai/toy-robot.git'
```

And then execute:

    $ bundle

Or install it yourself by pulling down the repository and then running:

    $ rake install

## Usage

Run
 
    $ toy-robot

to launch the Toy Robot program.

### Commands

| Command               | Description                                                               |
| ----------------------| ------------------------------------------------------------------------- |
| `place(X, Y, FACING)` | Places the robot at coordinates X, Y on the table, with facing FACING.    |
| `move`                | Moves the robot one unit forward in the direction it is currently facing. |
| `left`                | Rotates the robot 90 degrees to the left.                                 |
| `right`               | Rotates the robot 90 degrees to the left.                                 |
| `report`              | Announces the X,Y and FACING of the robot.                                |

## Contributing

1. Fork it ( https://github.com/maleckai/toy-robot/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
