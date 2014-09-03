Given(/^I am on the homepage$/) do
	visit('/')
end

When(/^I follow "(.*?)"$/) do |link_name|
	click_on(link_name)
end

When(/^I click on "(.*?)"$/) do |link_name|
	click_link(link_name)
end

When(/^I click "(.*?)"$/) do |link_name|
	click_link(link_name)
end

Then(/^I should see "(.*?)"$/) do |text|
	expect(page).to have_content(text)
end

Then(/^somewhere I can write my name$/) do
  expect(page).to have_field("name")
end

Then(/^a button that I can click$/) do
  expect(page).to have_button("submit")
end









