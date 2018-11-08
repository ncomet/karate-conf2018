Feature: demo with API of pokeapi.co

  Background:
    * url 'https://pokeapi.co/api/v2/pokemon'

  Scenario: should return Pikachu

    Given path '25'
    When method get
    Then status 200
    And match response contains { name: pikachu }
