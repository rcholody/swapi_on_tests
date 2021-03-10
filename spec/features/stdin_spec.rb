require_relative '../../spec/spec_helper'

describe "standard input" do
  it "should receive 'Luke'" do
    fake_stdin('Luke') do
      input = gets.to_s.chomp.strip
      input.should == 'Luke'
    end
  end
end