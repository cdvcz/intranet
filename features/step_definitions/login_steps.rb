# encoding: UTF-8

Given(/^An user exists$/) do
  @user = FactoryGirl.create(:user)
end

Given(/^An closed user exists$/) do
  @user = FactoryGirl.create(:user)
end

When(/^I go to "(.*?)"$/) do |url|
  visit path_to(url)
end

When(/^I fill valid username and password$/) do
  fill_in 'Uživatel', with: @user.login
  fill_in 'Heslo', with: @user.password
end

When(/^I fill invalid username and password$/) do
  fill_in 'Uživatel', with: @user.login
  fill_in 'Heslo', with: "spatneheslo"
end

When(/^I press "(.*?)"$/) do |selector|
  click_on selector
end

Then(/^I should see "(.*?)"$/) do |text|
  page.should have_content text
end
