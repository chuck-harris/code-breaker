
class OOutput

  def messages
    @messages ||= []
  end

  def puts( message )
    messages << message
  end
end

def o_output
  @o_output ||= OOutput.new
end

Given(/^I am not yet playing$/) do
end

When(/^I start a new game$/) do
  game = Codebreaker::Game.new( o_output )
  game.start '1234'
end

Then /^I should see "([^"]*)"$/ do |message|
  expect( o_output.messages ).to include( message )
end

Given /^the secret code is "([^"]*)"$/ do |secret|
  @game = Codebreaker::Game.new o_output
  @game.start secret
end

When /^I guess "([^"]*)"$/ do |guess|
  @game.guess guess
end

Then /^the mark should be "([^"]*)"$/ do |mark|
  expect( o_output.messages ).to include( mark )
end
