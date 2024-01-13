require 'spec_helper'

describe ShellTastic::Timer do
  it "reports start time" do
    start = ShellTastic::Timer.new.start
    expect(start.class).to eq(Time)
  end

  it "reports the stop time" do
    stop = ShellTastic::Timer.new.stop
    expect(stop.class).to eq(Time)
  end

  it "reports total time" do
    timer = ShellTastic::Timer.new
    start = timer.start
    sleep 2
    stop  = timer.stop
    total = timer.total_time
    expect(total.round).to eq(2)
  end

end
