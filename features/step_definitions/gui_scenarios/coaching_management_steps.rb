@inst = {}
@ca = {}
@fac = {}

Then(/^I see successful message "([^"]*)"$/) do |arg1|
  expect(page). to have_content(arg1)
end


When(/^I select "([^"]*)" "([^"]*)" from "([^"]*)", "([^"]*)" from "([^"]*)", "([^"]*)" from "([^"]*)"$/) do |arg1, arg2, arg3, arg4, arg5, arg6, arg7|
  page.find_by_id(arg1).select arg2, :from => arg3
  page.find_by_id(arg1).select arg4, :from => arg5
  page.find_by_id(arg1).select arg6, :from => arg7
end


When(/^I delete facilitator with cpf "([^"]*)"$/) do |arg1|
  page.find('tr', text: arg1).click_link("Destroy")
end
