
Feature: Set solved parking space problem
  Scenario: The user has privileges to set the problem as solved
    Given The system has stored the user "master" with preference for parking spaces in the "CIn" sector
    And The user is logged in the system
    And The problem report list has the problem with title "irregularidade", sector "Área II" and description "Iluminaçao"
    When The user try to set as solved the problem "irregularidade"
    Then The problem "irregularidade" is removed from parking report list

  Scenario: The user has no privileges to set the problem as solved
    Given The system has stored the user "outro" with preference for parking spaces in the "CIn" sector
    And The user is logged in the system
    And The problem report list has the problem with title "irregularidade", sector "Área II" and description "Iluminaçao"
    When The user try to set as solved the problem "irregularidade"
    Then The system show a message that user doesn't have the privileges
    And The problem "irregularidade" is not modified

  Scenario: The user has privileges to set the problem as solved web
    Given I signed up as "master" with preference for parking spaces in the "CIn" sector
    And The system has stored the user "marcio" with preference for parking spaces in the "CIn" sector
    And The user "marcio" has sended a report with the title "Iluminaçao", sector "Área II", and description "Iluminaçao"
    When I go to parking report list page
    And I see problem "Iluminaçao" in parkin report list flaged as not solved
    And I select the option to set the problem "Iluminaçao" as solved
    Then I can not see the problem "Iluminaçao" in the parking problem list

  Scenario: The user has no privileges to set the problem as solved web
    Given I signed up as "outro" with preference for parking spaces in the "CIn" sector
    And The system has stored the user "marcio" with preference for parking spaces in the "CIn" sector
    And The user "marcio" has sended a report with the title "Iluminaçao", sector "Área II", and description "Iluminaçao"
    When I go to parking report list page
    And I select the option to set the problem "Iluminaçao" as solved
    Then I see a message that i don't have the privileges
    And I see the problem "Iluminacao" continues in the parking report list