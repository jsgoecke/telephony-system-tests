Feature: Ensure the Asterisk Manager Interface (AMI) is up and running
  In order to ensure that the Asterisk instance is alive and well
  As a crucial part of my telephony infrastructure
  I want to connect to the AMI, login and ping the system

  Scenario: 
    Given a set of login details for my Asterisk Manager Interface
    When a test process connects, logins in and transmits a ping
    Then a pong of that ping should be received by the test process

