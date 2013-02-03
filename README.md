# Shelltastic
Shelltastic is a *nix shell wrapper for ruby...nothing else.

## Installation

Add this line to your application's Gemfile:

    gem 'shelltastic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shelltastic

## Usage

 `ShellTastic::Command.run("date")`

Will return a Hash of meta-data pertaining to the above command.

` { :output, :pid, :error, :start, :stop, :total_time, :exitstatus }`

For example, the above command's return would look something like this:

`{:output=>"Sun Feb  3 17:41:45 EST 2013", :pid=>17507, :error=>"", :start=>2013-02-03 17:41:45 -0500, :stop=>2013-02-03 17:41:45 -0500, :total_time=>0.004405272, :exitstatus=>0}`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
