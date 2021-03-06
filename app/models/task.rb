class Task < ActiveRecord::Base
  belongs_to :user
  validates :title, :description, presence: true

  def completed?
    self.completed_at == nil ? self.completed_at = Time.now : self.completed_at = nil

    self.save
  end
end
