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

Then(/^a button that says "(.*?)"$/) do |contents|
	expect(page).to have_link(contents)
end

Given(/^I've started a game with the players "(.*?)" and "(.*?)"$/) do |arg1, arg2|
	steps %Q{
	Given Dave has added himself as a player
	When I submit "Ethel" as my name
	}
end

When(/^I click on the "(.*?)" button$/) do |link|
  	click_link(link)
end

Then(/^I should be on the ship placement page$/) do
  	expect(page.current_path).to eq '/ship_placement'
end

Given(/^I am on the ship placement page$/) do
	steps %Q{
		Given I've started a game with the players "Dave" and "Ethel"
		When I click on the "start placing ships" button
	}
end

Then(/^I should see a grid for placing a ships on$/) do
  	expect(page).to have_selector('div#ship_placement')
end

Then(/^it is a (\d+)x(\d+) grid$/) do |length, width|
  	expect(page).to have_selector('div.cell', :count => (length.to_i * width.to_i))
end