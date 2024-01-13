# Shelltastic
Shelltastic is simple *nix shell wrapper for ruby.  You can pass a single command or multiple commands to run.

[![Gem Version](https://badge.fury.io/rb/shelltastic.svg)](https://badge.fury.io/rb/shelltastic)


## Installation

Add this line to your application's Gemfile:

    gem 'shelltastic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shelltastic

## Usage

### Run 

 ```ruby
ShellTastic::Command.run("date")
```

The above will return an Array of hash meta-data.

```ruby 
[{ :output, :pid, :error, :start, :stop, :total_time, :exitstatus, :command }]
```

For example, the above command's return would look something like this:

```ruby
[
  {
    :output=>"Sun Feb  3 17:41:45 EST 2013", 
    :pid=>17507, 
    :command => "date",
    :error=>false, 
    :start=>2013-02-03 17:41:45 -0500, 
    :stop=>2013-02-03 17:41:45 -0500, 
    :total_time=>0.004405272, 
    :exitstatus=>0
  }
]
```

You can also pass multiple commands separated by commas or pass an array.

```ruby
ShellTastic::Command.run("date", "whoami")
```

```ruby
ShellTastic::Command.run(["date", "whoami"])
```

```ruby
[
  {
    :output=>"Sat Apr  6 15:26:05 EDT 2013", 
    :pid=>92558, 
    :error=>false, 
    :start=>2013-04-06 15:26:05 -0400, 
    :stop=>2013-04-06 15:26:05 -0400, 
    :command=>"date", 
    :total_time=>0.010004, 
    :exitstatus=>0
   }, 

   {
     :output=>"bradleydsmith", 
     :pid=>92559, 
     :error=>false, 
     :start=>2013-04-06 15:26:05 -0400, 
     :stop=>2013-04-06 15:26:05 -0400, 
     :command=>"whoami", 
     :total_time=>0.008262, 
     :exitstatus=>0
    }
]
```

### Start
Start will run a command in the background and return the pid immediately.

It takes the same command arguments as `#run`

The parent process (you) will not wait for the child to finish or return any information.

This is useful if you want to run a command, but dont care about the output or exit status.

__BEWARE__ of long running commands that could fail. ShellTastic detaches itself from the child command.



```ruby
ShellTastic::Command.start("sleep 10; date")
```
or

```ruby
ShellTastic::Command.start(["sleep 10", "date"])
```

The above will return an Array of hash meta-data.

```ruby 
[{ :output, :pid, :error, :start, :stop, :total_time, :exitstatus, :command }]
```

For example, the above command's return would look something like this:

```ruby
[
  { 
    :output=>nil, 
    :pid=>17507, 
    :error=>false, 
    :start=>2013-02-03 17:41:45 -0500, 
    :stop=>2013-02-03 17:41:45 -0500, 
    :command=>"sleep 10; date", 
    :total_time=>0.004405272, 
    :exitstatus=>nil
  }
]
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
