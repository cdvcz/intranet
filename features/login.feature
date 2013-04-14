@javascript
Feature: Autentizace uzivatelu

  Background:
    Given An user exists

  Scenario: Uzivatel se muze prihlasit s platnymi udaji
    When I go to "the homepage"
    And I fill valid username and password
    And I press "Přihlásit se"
    Then I should see "Byl jste přihlášen"

  Scenario: Uzivatel nemuze prihlasit se spatnym heslem
    Given An closed user exists
    When I go to "the homepage"
    And I fill invalid username and password
    And I press "Přihlásit se"
    Then I should see "Nesprávné uživatelské jméno nebo heslo"
