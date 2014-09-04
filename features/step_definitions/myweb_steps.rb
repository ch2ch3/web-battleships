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

Then(/^I should see a form for adding a player$/) do
 	expect(page).to have_field("player")
end

Then(/^I should see a submit button$/) do
 	expect(page).to have_button("submit")
end

Given(/^I am on the new game page$/) do
	visit '/new_game'
end

When(/^I submit "(.*?)" as my name$/) do |name|
	fill_in("player", with: name)
	click_button("submit")
end

Given(/^I am the only player so far$/) do
	expect(current_url).to match(/new_game$/)
end

When(/^I submit my name without typing anything in$/) do
	click_button("submit")
end

When(/^Player One has added themselves as "(.*?)"$/) do |name|
  fill_in("player", with: name)
  click_button("submit")
end

Given(/^Dave has added himself as a player$/) do
	steps %Q{
	Given I am on the new game page
	When I submit "Dave" as my name
	}
end
