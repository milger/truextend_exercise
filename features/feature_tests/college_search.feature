#
# @Author Milger Cabezas
#

@college_search
Feature:  College search

Scenario: Find a school match using Location and Major

   Given I navigated to "www.collegeview.com"
   When I click on START SEARCHING button
      And I select the locations
         |Ohio|
      And I click on "Majors" finding criteria
      And I select the "Bachelor's (4-year) Degree" radio button
      And I add majors related to "Software Engineering"
         |Computer Software Engineering|
   Then "Miami University-Oxford" with "100%" match result should be displayed
