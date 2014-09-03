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