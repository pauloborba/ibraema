require_relative '/home/rsg3/Documents/workspace/ibraema/lib/time_utils.rb'
@inst = {}
@ca = {}
@fac = {}

Given(/^"([^"]*)" with cnpj "([^"]*)" is registered as a partner$/) do |arg1, arg2|
  @inst = {institution: {name: arg1, cnpj: arg2}}
  post '/institutions', @inst
  @inst = Institution.find_by(cnpj: arg2)
end

When(/^I register a coaching activity starting at day "([^"]*)" and finishing at "([^"]*)" at institution "([^"]*)"$/) do |arg1, arg2, arg3|
  @ca = {coaching_activity: {date_start: TimeUtils.toTimestamp(arg1), date_finish: TimeUtils.toTimestamp(arg2), institution_id: @inst.id}}
  post '/institutions/' + @inst.id.to_s + '/coaching_activities', @ca
  @ca = CoachingActivity.find_by(date_start: TimeUtils.toTimestamp(arg1))
end

Then(/^the coaching activity is register on the system$/) do
  expect(@ca).not_to be nil
end

Then(/^it belongs to institution "([^"]*)"$/) do |arg1|
  expect(@inst.coaching_activities).not_to be nil
end

Given(/^the coaching activity at "([^"]*)" starting at "([^"]*)" and finishing at "([^"]*)" is registered on the system$/) do |arg1, arg2, arg3|
  @ca = {coaching_activity: {date_start: TimeUtils.toTimestamp(arg2), date_finish: TimeUtils.toTimestamp(arg3), institution_id: @inst.id}}
  post '/institutions/' + @inst.id.to_s + '/coaching_activities', @ca
  @ca = CoachingActivity.find_by(date_start: TimeUtils.toTimestamp(arg2))
  expect(@ca).not_to be nil
end

Given(/^the facilitator with name "([^"]*)" and cpf "([^"]*)" is not registered on coaching activity at "([^"]*)"$/) do |arg1, arg2, arg3|
  expect((@ca.facilitators.select {|f| (f.cpf == arg2)}).length).to be == 0
end

When(/^I register the facilitator with name "([^"]*)" and cpf "([^"]*)" at coaching activity at "([^"]*)"$/) do |arg1, arg2, arg3|
  @fac = {facilitator: {name: arg1, cpf: arg2}}
  post '/institutions/' + @inst.id.to_s + '/coaching_activities/' + @ca.id.to_s + '/facilitators', @fac
end

Then(/^the facilitator is registered on the coaching activity at "([^"]*)"\.$/) do |arg1|
  expect(@ca.facilitators).not_to be nil
end

Given(/^the facilitator with name "([^"]*)" and CPF "([^"]*)" is registered on the coaching$/) do |arg1, arg2|
  @fac = {facilitator: {name: arg1, cpf: arg2}}
  post '/institutions/' + @inst.id.to_s + '/coaching_activities/' + @ca.id.to_s + '/facilitators', @fac
end

When(/^I unregister the facilitator with cpf "([^"]*)" from coaching activity at "([^"]*)"$/) do |arg1, arg2|
  @ca.facilitators.delete(Facilitator.find_by(cpf: arg1))
end

Then(/^the facilitator with cpf "([^"]*)" is no longer at the coaching activity$/) do |arg1|
  expect(@ca.facilitators.select{|f| (f.cpf == arg1)}.length).to be == 0
end

Then(/^the facilitator with cpf "([^"]*)" only appears once on the coaching activity facilitators list$/) do |arg1|
  expect(@ca.facilitators.select{|f| (f.cpf == arg1)}.length).to be == 1
end
