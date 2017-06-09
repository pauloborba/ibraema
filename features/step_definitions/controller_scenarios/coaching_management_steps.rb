require_relative '/home/rsg3/Documents/workspace/ibraema/lib/time_utils.rb'
@inst = {}
@ca = {}
@fac = {}

Given(/^"([^"]*)" with cnpj "([^"]*)" is registered as a partner$/) do |arg1, arg2|
  @inst = {institution: {name: arg1, cnpj: arg2}}
  post '/institutions', @inst
  @inst = Institution.find_by(cnpj: arg2)
end

Given(/^the facilitator with name "([^"]*)" and CPF "([^"]*)" is registered$/) do |arg1, arg2|
  @fac = {facilitator: {name: arg1, cpf: arg2, institution_id: @inst.id}}
  post '/facilitators', @fac
  @fac = Facilitator.find_by(cpf: arg2)
end

When(/^I register a coaching activity starting at day "([^"]*)" and finishing at "([^"]*)" at institution "([^"]*)" with facilitator with cpf "([^"]*)" to the coaching$/) do |arg1, arg2, arg3, arg4|
  @ca = {coaching_activity: {date_start: TimeUtils.toTimestamp(arg1), date_finish: TimeUtils.toTimestamp(arg2), institution_id: @inst.id}}
  post '/coaching_activities', @ca
  @ca = CoachingActivity.find_by(institution_id: @inst.id)
  @fac.coaching_activities << @ca
end

Then(/^the coaching activity is register on the system$/) do
  expect(CoachingActivity.find(@ca)).not_to be nil
end

Then(/^the coaching activity at "([^"]*)" has the facilitator with CPF "([^"]*)"$/) do |arg1, arg2|
  @fac = @ca.facilitators.where(cpf: arg2)
  expect(@fac).not_to be nil
end

Given(/^the coaching activity at "([^"]*)" starting at "([^"]*)" and finishing at "([^"]*)" is registered on the system$/) do |arg1, arg2, arg3|
  @ca = {coaching_activity: {date_start: TimeUtils.toTimestamp(arg2), date_finish: TimeUtils.toTimestamp(arg3), institution_id: @inst.id}}
  post '/coaching_activities', @ca

  @ca = CoachingActivity.find_by(institution_id: @inst.id)

  expect(@ca).not_to be nil
end

Given(/^the facilitator with name "([^"]*)" and cpf "([^"]*)" is not registered on coaching activity at "([^"]*)"$/) do |arg1, arg2, arg3|
  expect(@ca.facilitators.where(cpf: arg2)[0]).to be nil
end

When(/^I register the facilitator with name "([^"]*)" and cpf "([^"]*)" at coaching activity at "([^"]*)"$/) do |arg1, arg2, arg3|
  @fac = {facilitator: {name: arg1, cpf: arg2, institution_id: @inst.id}}
  post '/facilitators', @fac
  @fac = Facilitator.find_by(cpf: arg2)
  @fac.coaching_activities << @ca
end

Then(/^the facilitator is registered on the coaching activity at "([^"]*)"\.$/) do |arg1|
  expect(@fac.coaching_activities[0]).not_to be nil
end

Given(/^is signed up on the coaching at "([^"]*)"$/) do |arg1|
  @fac.coaching_activities << @ca
  expect(@fac.coaching_activities[0]).not_to be nil
end

When(/^I unregister the facilitator with cpf "([^"]*)" from coaching activity at "([^"]*)"$/) do |arg1, arg2|
  @fac = Facilitator.find_by(cpf: arg1)
  @fac.coaching_activities.delete(@ca)
end

Then(/^the facilitator with cpf "([^"]*)" is no longer at the coaching activity$/) do |arg1|
  expect(@fac.coaching_activities[0]).to be nil
end

Then(/^he only appears once on the coaching activity facilitators list$/) do
  if (@ca.facilitators.where(cpf: @fac.cpf).length > 1) then
    @ca.facilitators.delete(@fac)
  end
  expect(@ca.facilitators.where(cpf: @fac.cpf).length > 1).to be false
end
