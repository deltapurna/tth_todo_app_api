require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  setup do
    @task = Task.create!(name: 'Picking up Puti in campus', completed_at: nil)
  end
  test "validates presence of name" do
    task = Task.new(name: nil)

    assert_equal false, task.valid?
  end

  test "#as_json output" do
    assert_equal ({ 
      id: @task.id,
      name: @task.name, 
      completed_at: @task.completed_at 
    }).to_json, @task.to_json
  end
end
