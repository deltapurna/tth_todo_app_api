class Task < ActiveRecord::Base
  scope :incomplete, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }

  validates :name, presence: true

  def as_json(options={})
    super(only: [:id, :name, :completed_at])
  end
end
