@javascript
Feature: Autentizace uzivatelu

  Background:
    Given An user exists

  Scenario: Uzivatel se muze prihlasit s platnymi udaji
    When I go to "the homepage"
    And I fill valid username and password
    And I press "Přihlásit se"
    Then I should see "Tajna stranka"
    And I should see "Odhlasit"
    And I press "Odhlasit"
    And I should see "Přihlašte se, prosím"

  Scenario: Uzivatel nemuze prihlasit se spatnym heslem
    Given An user exists
    When I go to "the homepage"
    And I fill invalid username and password
    And I press "Přihlásit se"
    Then I should see "Nesprávné uživatelské jméno nebo heslo"

