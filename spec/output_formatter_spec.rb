require 'spec_helper'

describe ShellTastic::OutputFormatter do
  before :each do
    @result = ShellTastic::OutputFormatter.new
    @result.build(output: "Fri Feb 14 20:54:59 MST 2014",
                  pid: "10000000",
                  error: "No such file or directory")
  end
  it "returns a hash" do
    expect(@result.inspect).to be_kind_of(Hash)
  end

  it "allows to add key value pairs" do
    @result.command = "date"
    expect(@result.inspect[:command]).to eq("date")
  end

  it "contains total time" do
    timer = ShellTastic::Timer.new
    @result.start = timer.start
    @result.stop  = timer.stop
    @result.total_time = timer.total_time
    expect(@result.total_time).to_not be_nil
  end
end
