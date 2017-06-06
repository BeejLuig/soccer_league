# SoccerLeague

Welcome to Soccer League! This is a command-line application that calculates the ranking table for a soccer league.

## Usage

To get started, `cd` into this directory, then run:

`bin/soccer_league`

You will be prompted to enter the pathname for a valid file. A sample file is already in the root of this directory, so you can just enter `sample-input.txt`. To use any other file, drop it into the root directory and enter the file name, or enter the full pathname.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

*A note on testing*: If you run the tests out of the box, some will fail due to private methods. Go to `lib/soccer_league/cli.rb` around line 26 and remove the `private` keyword before running `rspec`.

To debug using Pry, open `lib/soccer_league.rb` and uncomment line 2.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/BeejLuig/soccer_league.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
