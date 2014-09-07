require 'test_helper'

class DeleteTaskTest < ActionDispatch::IntegrationTest
  setup do
    Task.create!(name: 'Picking up Puti in campus', completed_at: nil)
  end

  test "delete task" do
    delete '/tasks/1'

    assert_equal 204, response.status
  end
end
