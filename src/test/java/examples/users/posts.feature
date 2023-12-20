@Crud
Feature: sample api crud

  Background:
    * url 'https://642afabeb11efeb759a7beff.mockapi.io/test/'

  Scenario: add new post
    * def NewPost =
    """
    {
        "name": "ibn test add"
    }
    """
    Given path 'post'
    And request NewPost
    When method post
    Then status 201

    * def resAdd = response
    * print 'Successfully add new Post : ', resAdd

  Scenario: get all post
    Given path 'post'
    When method get
    Then status 200

  Scenario: get specific post id
    Given url 'https://642afabeb11efeb759a7beff.mockapi.io/test/post/6'
    When method get
    Then status 200

    * def id = response.id
    * def name = response.name
    * print 'This is the Post that you want: ', id, " => " ,name

    Given path id

  Scenario: edit the post
    * def DataPost =
    """
    {
        "name": "ibn test edit"
    }
    """
    Given url 'https://642afabeb11efeb759a7beff.mockapi.io/test/post/6'
    And request DataPost
    When method put
    Then status 200

  Scenario: delete post by id
    Given url 'https://642afabeb11efeb759a7beff.mockapi.io/test/post/3'
    When method delete
    Then status 200

    * def res = response
    * print 'The response is : ', res



