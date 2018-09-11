Feature: demo with API of cfp.devoxx.fr

  Background:
    * url 'https://pokeapi.co/api/v2'

  Scenario: should return Pikachu

    Given path 'pokemon-form', '25'
    When method get
    Then status 200
    And match response contains { name: pikachu }
