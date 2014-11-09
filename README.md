# Shelltastic
Shelltastic is simple *nix shell wrapper for ruby.  You can pass a single command or multiple commands to run.

## Installation

Add this line to your application's Gemfile:

    gem 'shelltastic'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shelltastic

## Usage

__Version >= 1.0 require ruby `2.1+`__

If you need to use older versions of ruby please use gem version <= `1`

##### Version 1.x
Is a complete re-write and is not backwards compatible.  Use `0.x` instead

### Run 

 ```ruby
ShellTastic.run("date")
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
ShellTastic.run("date", "whoami")
```

```ruby
ShellTastic.run(["date", "whoami"])
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

### Non-Blocking execution

You can run a command in the background and return the pid immediately.

`#run` takes an optional hash that can be passed in

* Command blocks by default


The parent process (you) will not wait for the child to finish or return any information.

This is useful if you want to run a command, but dont care about the output or exit status.

__BEWARE__ of long running commands that could fail.  ShellTastic detaches itself from the child command.



```ruby
ShellTastic.run("sleep 10; date", block: false)
```
or

```ruby
ShellTastic.run(["sleep 10", "date"], block: false)
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
