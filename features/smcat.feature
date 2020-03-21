Feature: SMCat


  Background: I have a file with SMCat
    Given I have a file 'smcat.md' with content:
      """
      ---
      ---

      {% smcat %}
      initial => smcat;
      {% endsmcat %}
      """

  Scenario: Basic Rendering
    When I run jekyll build
    Then the file '_site/smcat.html' should exist
    And I should see svg output in '_site/smcat.html'

  Scenario: Remove XML Heading
    When I run jekyll build
    Then the file '_site/smcat.html' should exist
    And I should not see '<\?xml' in '_site/smcat.html'
    And I should not see '<!DOCTYPE' in '_site/smcat.html'
