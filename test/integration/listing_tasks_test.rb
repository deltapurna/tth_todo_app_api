require 'test_helper'

class ListingTasksTest < ActionDispatch::IntegrationTest
  setup do
    Task.create!(name: 'Picking up Puti in campus', completed_at: nil)
    Task.create!(name: 'Clean the bathroom', completed_at: nil)
    Task.create!(name: 'Service old thinkpad laptop', completed_at: Date.yesterday)
  end

  test "listing incomplete tasks (default)" do
    get '/tasks'

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type

    assert_equal 2, JSON.parse(response.body).size
  end

  test "listing completed tasks" do
    get '/tasks', { completed: true }

    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    
    assert_equal 1, JSON.parse(response.body).size
  end
end
