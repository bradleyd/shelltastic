require 'spec_helper'

describe ShellTastic::Timer do
  it "should start timer" do
    start = ShellTastic::Timer.start
    start.class.should eq(Time)
  end

  it "should report total time taken" do
    start = ShellTastic::Timer.start
    sleep 2
    stop  = ShellTastic::Timer.stop
    took  = ShellTastic::Timer.total_time
    # should be two seconds or so...
    took.round.should eq(2)
  end

end
