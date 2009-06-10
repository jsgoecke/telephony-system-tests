Feature: Ensure Adhearsion is up and running and talking to the Asterisk Manager Interface (AMI)
  In order to ensure that the Adhearion instance is alive and well
  As a crucial part of my telephony infrastructure
  I want to connect to the AMI, login and ping the system

  Scenario: 
    Given a Distributed Ruby connection to my Adhearsion server
    When a test process connects, and transmits a ping to Adhearsion
    Then a pong of that ping should be received by the test process back from Adhearsion