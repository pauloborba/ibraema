require_relative '/home/ubuntu/workspace/lib/time_utils.rb'
@inst = {}
Given(/^"([^"]*)" with cnpj "([^"]*)" is registered as a partner$/) do |arg1, arg2|
    inst = {institution: {name: arg1, cnpj: arg2}}
    
    
    post '/institutions', inst
      
    inst = Institution.find_by(name: arg1)
    
    @inst = inst
    
    expect(inst).not_to be nil
end

Given(/^the facilitator with name "([^"]*)" and CPF "([^"]*)" is registered$/) do |arg1, arg2|
    fac = {facilitator: {name: arg1, cpf: arg2, institution_id: @inst.id}}
    
    post '/facilitators', fac
    
    fac = Facilitator.find_by(name: arg1)
    
    expect(fac).not_to be nil
end

When(/^I register a coaching activity starting at day "([^"]*)" and finishing at "([^"]*)" at institution "([^"]*)"$/) do |arg1, arg2, arg3|
    @ca = {coaching_activity: {date_start: TimeUtils.toTimestamp(arg1), date_finish: TimeUtils.toTimestamp(arg2), institution_id: @inst.id}}
    
    post '/coaching_activities', @ca
    
    @ca = CoachingActivity.find_by(institution: @inst.id)
    
    expect(@ca).not_to be nil
end

Then(/^the coaching activity is register on the system$/) do
  expect(CoachingActivity.find_by(id: @ca.id)).not_to be nil
end

Then(/^the coaching activity at "([^"]*)" has the facilitator with CPF "([^"]*)"$/) do |arg1, arg2|
  expect(CoachingActivity.find_by(id: @ca.id))
end

Given(/^there is a coaching activity at "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^the facilitator is not registered on coaching activity at "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I register the facilitator with name "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^CPF "([^"]*)" on coaching activity at "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the facilitator is registered on the coaching activity at "([^"]*)"\.$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^there is a coaching activity at  "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^the facilitator "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^CPF "([^"]*)" to the existing coaching activity at "([^"]*)"\.$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I unregister the facilitator with name "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^CPF "([^"]*)" from the coaching activity at "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the facilitator is unregistered from the coaching activity at "([^"]*)"\.$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am at the "([^"]*)" page$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I select the partner institution "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I fill the facilitators infos, name: "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^CPF: "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I create a new coaching activity at "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see a confirmation message$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see the coaching activity at "([^"]*)" details$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^the facilitator with cpf "([^"]*)" is on the facilitators list$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^I am at the "([^"]*)" page, under the sub\-page "([^"]*)"$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I register a new facilitator with name: "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see the coaching activity at "([^"]*)" updated details$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Given(/^the facilitator with name: "([^"]*)" And CPF: "([^"]*)" is registered the coaching activity at "([^"]*)"$/) do |arg1, arg2, arg3|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I unregister the facilitator with name: "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I see facilitator "([^"]*)" on coaching activity at "([^"]*)" details$/) do |arg1, arg2|
  pending # Write code here that turns the phrase above into concrete actions
end