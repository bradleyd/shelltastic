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

 `ShellTastic::Command.run("ls -l")`

Would return a Hash of meta-data pertaining to the above command.

`[:output, :pid, :error, :start, :stop, :total_time, :exitstatus]`

For example, the above command's return would look something like this:

`{:output=>"total 36\n-rw-rw-r-- 1 bradleyd bradleyd   96 Dec  2 17:28 Gemfile\n-rw-rw-r-- 1 bradleyd bradleyd  143 Dec  2 18:20 Gemfile.lock\ndrwxrwxr-x 3 bradleyd bradleyd 4096 Dec 27 22:38 lib\n-rw-rw-r-- 1 bradleyd bradleyd 1066 Dec  2 17:28 LICENSE.txt\ndrwxrwxr-x 2 bradleyd bradleyd 4096 Dec 27 22:28 pkg\n-rw-rw-r-- 1 bradleyd bradleyd  130 Dec  5 22:22 Rakefile\n-rw-rw-r-- 1 bradleyd bradleyd  539 Dec  2 17:28 README.md\n-rw-rw-r-- 1 bradleyd bradleyd  839 Dec 19 19:48 shelltastic.gemspec\ndrwxrwxr-x 2 bradleyd bradleyd 4096 Dec 27 23:03 spec", :pid=>17655, :error=>"", :start=>2012-12-27 23:03:11 -0500, :stop=>2012-12-27 23:03:11 -0500, :total_time=>0.003623604, :exitstatus=>0}`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
