Feature: Online Calculator

    Scenario Outline: Adding 2 numbers

        Given I am on calculator page
        When I add <num1> and <num2>
        Then I expect result to be <result>
        Examples:
            | num1 | num2 | result |
            | 5    | 5    | 10     |
            | 100  | 30   | 130    |
            | 999  | 999  | 1 998  |
            | 11   | 1.38 | 12.38  |

    Scenario Outline: Subtracting 2 numbers

        Given I am on calculator page
        When I subtract <num1> and <num2>
        Then I expect result to be <result>
        Examples:
            | num1 | num2 | result |
            | 5    | 5    | 0      |
            | 10   | 30   | -20    |
            | 1999 | 99   | 1 900  |
            | 10   | 1.55 | 8.45   |

    Scenario Outline: Dividing 2 numbers

        Given I am on calculator page
        When I divide <num1> and <num2>
        Then I expect result to be <result>
        Examples:
            | num1 | num2 | result     |
            | 15   | 15   | 1          |
            | 100  | 12.5 | 8          |
            | 50   | 130  | 0.38461539 |
            | 450  | 3    | 150        |
            | 150  | 0    | Error      |

    Scenario Outline: Multiplying 2 numbers

        Given I am on calculator page
        When I multiply <num1> and <num2>
        Then I expect result to be <result>
        Examples:
            | num1 | num2 | result |
            | 100  | 0    | 0      |
            | 9    | 9    | 81     |
            | 700  | 3    | 2 100  |
            | 5    | 87.5 | 437.5  |

    Scenario: Inputing max number of digits

        Given I am on calculator page
        When I key-in 3 15 times
        Then I expect result to be 333 333 333

    Scenario: Inputing max decimal places

        Given I am on calculator page
        When I enter 9
        And I enter .
        And I enter 99999999
        Then I expect result to be 9.99999999

    Scenario Outline: Result of operation is more than max number of digits

        Given I am on calculator page
        When I multiply <num1> and <num2>
        Then I expect result to be <result>
        Examples:
            | num1      | num2 | result      |
            | 999999999 | 3    | 3e+9        |
            | 555555555 | 5    | 2.777778e+9 |
            | 898956562 | 8    | 7.191653e+9 |

    Scenario Outline: Add 3 or more numbers

        Given I am on calculator page
        When I enter 5
        And I enter +
        And I enter 10
        And I enter +
        Then I expect result to be 15
        When I enter 3
        And I enter +
        Then I expect result to be 18
        When I enter 15
        And I enter =
        Then I expect result to be 33

    Scenario Outline: Subtract 3 or more numbers

        Given I am on calculator page
        When I enter 100
        And I enter -
        And I enter 1
        And I enter -
        Then I expect result to be 99
        When I enter 10
        And I enter -
        Then I expect result to be 89
        When I enter 80
        And I enter =
        Then I expect result to be 9

    Scenario Outline: Divide 3 or more numbers

        Given I am on calculator page
        When I enter 1000
        And I enter /
        And I enter 2
        And I enter /
        Then I expect result to be 500
        When I enter 5
        And I enter /
        Then I expect result to be 100
        When I enter 4
        And I enter =
        Then I expect result to be 25

    Scenario Outline: Multiple 3 or more numbers

        Given I am on calculator page
        When I enter 5
        And I enter *
        And I enter 5
        And I enter *
        Then I expect result to be 25
        When I enter 10
        And I enter *
        Then I expect result to be 250
        When I enter 2
        And I enter =
        Then I expect result to be 500

    Scenario Outline: Use multiple operators on 3 or more numbers

        Given I am on calculator page
        When I enter 100
        And I enter +
        And I enter 10
        And I enter -
        And I enter 60
        And I enter =
        And I enter *
        And I enter 3
        And I enter =
        And I enter /
        And I enter 2
        And I enter =
        Then I expect result to be 75
