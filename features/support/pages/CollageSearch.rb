#
# Page class for College Search
# 
# @Author Milger Cabezas
#

def college_search_Page
  @college_search_Page ||= CollegeSearchPage.new
end

class CollegeSearchPage
  include Capybara::DSL

  def initialize
    # locators
    @picklist_class = '.ui-picklist-options'
    @pick_option_class = '.ui-picklist-option'
  end

  def click_start_searching()
    image_button = page.find(:xpath, ".//img[@src='/_img/start_searching.jpg']")
    image_button.click
  end

  def add_multiple_locations(location_list)
    location_options = page.find(@picklist_class)
    for location_text in location_list
      location_options.find(@pick_option_class, :text => location_text).click
    end
  end
  
  def click_criteria_option(criteria_text)
    criteria_panel = page.find_by_id("criteriaPanel")
    criteria_panel.find('a', :text => criteria_text).click
  end
  
  def set_major_text_criteria(text)
    page.find_by_id('majorSearchText').set(text)
  end
  
  def add_multiple_majors(major_list)
    major_options = page.find(@picklist_class)
    for mejor_text in major_list
      major_options.find(@pick_option_class, :text => mejor_text).click
    end
  end
  
  def get_percentage_match_from_result(school_name)
    result_item = page.find('.resultItemPanel', :text => school_name)
    result = result_item.find('.percentMatch').text
    return result
  end
  
end
