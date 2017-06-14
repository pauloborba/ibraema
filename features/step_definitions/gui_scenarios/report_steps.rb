Then(/^The download starts$/) do
  expect(/^%PDF?/.match(page.body)).not_to be nil
end