Feature: trying to discover the secret

  Background:
    * url baseUrl
    * header Authorization = call read('authentication.js') { username: 'sensei', password: 'suchWisdom' }

  Scenario: call the special endpoint

    Given path 'secret'
    When method get
    Then status 200
    And print 'What is the secret Master ? : ' + response
