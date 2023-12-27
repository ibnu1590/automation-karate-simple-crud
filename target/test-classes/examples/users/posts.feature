@post_feature
Feature: sample api crud

  Background:
    * url 'https://658b9a7e859b3491d3f4765d.mockapi.io/test/'

  @AddPost @Smoke
  Scenario: add new post
    * def newPost =
    """
    {
        "name": "this is new post"
    }
    """

    Given path 'post'
    And request newPost
    When method post
    Then status 201

    * def resAdd = response
    * print 'Successfully add new Post : ', resAdd

  @GetAllPost
  Scenario: get all post
    Given path 'post'
    When method get
    Then status 200

  Scenario: get specific post id
    Given path 'post/3'
    When method get
    Then status 200

    * def id = response.id
    * def name = response.name
    * print 'This is the Post that you want: ', id, " => " ,name


  Scenario: edit the post
    Given url 'https://658b9a7e859b3491d3f4765d.mockapi.io/test/post/3'
    And header Content-Type = 'application/x-www-form-urlencoded'
    And request 'name=cobaeditpost'
    When method put
    Then status 200

    #after run this scenario you must change the id (post/2) because the data has been deleted
  Scenario: delete post by id
    Given path 'post/5'
    When method delete
    Then status 200

    * def res = response
    * print 'The response is : ', res



