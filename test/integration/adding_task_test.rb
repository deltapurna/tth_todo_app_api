require 'test_helper'

class AddingTaskTest < ActionDispatch::IntegrationTest
  test 'adding task with valid parameters' do
    post '/tasks', { 
      task: { name: 'a new task' }
    }.to_json, { 'Content-Type' => 'application/json' }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 'a new task', JSON.parse(response.body)['name']
  end

  test 'not adding task with invalid parameters' do
    post '/tasks', {
      task: { name: nil }
    }.to_json, { 'Content-Type' => 'application/json' }

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
