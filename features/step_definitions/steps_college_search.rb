#
# Step definitions for College Search
# 
# @Author Milger Cabezas
#

When /^I (?:navigate|navigated) to "(.*?)"$/ do |url_name|
  page.visit "http://#{url_name}"
  page.driver.browser.manage.window.maximize
end

When /^I click on START SEARCHING button$/ do
  college_search_Page.click_start_searching()
end

When /^I (?:select|selected) the locations$/ do |location_table|
  location_list = location_table.transpose.raw.first
  step 'I click on "Location" finding criteria'
  college_search_Page.add_multiple_locations(location_list)
end

When /^I click on "(.*?)" finding criteria$/ do |criteria_text|
  college_search_Page.click_criteria_option(criteria_text)
end

When /^I select the "(.*?)" radio button$/ do |radio_button_label|
  page.choose(radio_button_label)
end

When /^I add majors related to "(.*?)"$/ do |criteria_text, major_options|
  major_list = major_options.transpose.raw.first
  college_search_Page.set_major_text_criteria(criteria_text)
  college_search_Page.add_multiple_majors(major_list)
end

Then /^"(.*?)" with "(.*?)" match result should be displayed$/ do |school_name, percent_match|
  actual_percent_match =college_search_Page.get_percentage_match_from_result(school_name)
  expect(actual_percent_match).to eql percent_match
end
