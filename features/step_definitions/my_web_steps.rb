When(/^I go to the battleships webpage$/) do
  visit '/'
end

Then(/^I should see "(.*?)"$/) do |text|
  expect(page).to have_content(text)
end

Then(/^a submit button$/) do
  expect(page).to have_button("submit_name")
end

Given(/^I am on the home page$/) do
  visit '/'
end

When(/^I enter "(.*?)" as my name$/) do |name|
  fill_in('player_name', :with => name)
end

When(/^I press the submit button$/) do
  click_button('submit_name')
end
