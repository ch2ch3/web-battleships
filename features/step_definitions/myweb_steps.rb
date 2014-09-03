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

Then(/^I should see a form for "(.*?)" input$/) do |field_name|
 	expect(page).to have_field(field_name)
end

Then(/^I should see a submit button$/) do
 	expect(page).to have_button("submit")
end

Given(/^I am on the new game page$/) do
	visit '/new_game'
end

When(/^I submit "(.*?)" as my name$/) do |name|
	fill_in("name", with: name)
	click_button("submit")
end