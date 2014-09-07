require 'test_helper'

class UpdatingTaskTest < ActionDispatch::IntegrationTest
  setup do
    @task = Task.create!(name: 'Picking up Puti in campus', completed_at: nil)
  end
  test "updates task when valid parameters" do
    patch '/tasks/1', {
      task: { 
        name: @task.name + ' before 3 PM',
        completed_at: Date.yesterday
      }
    }.to_json, { 'Content-Type' => 'application/json' }

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    response_body = JSON.parse(response.body)
    task = Task.find(response_body['id'])
    assert_equal task_url(task), response.location

    assert_equal @task.name + ' before 3 PM', JSON.parse(response.body)['name']
  end

  test "not update task when invalid parameters" do
    patch '/tasks/1', {
      task: { name: nil }
    }.to_json, { 'Content-Type' => 'application/json' }

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end
end
