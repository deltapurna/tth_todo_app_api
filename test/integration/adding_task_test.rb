require 'test_helper'

class AddingTaskTest < ActionDispatch::IntegrationTest
  test 'adding task with valid parameters' do
    post '/tasks', { 
      task: { name: 'a new task' }
    }.to_json, { 'Content-Type' => 'application/json' }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    response_body = JSON.parse(response.body)
    task = Task.find(response_body['id'])
    assert_equal task_url(task), response.location

    assert_equal 'a new task', response_body['name']
  end

  test 'not adding task with invalid parameters' do
    post '/tasks', {
      task: { name: nil }
    }.to_json, { 'Content-Type' => 'application/json' }

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
