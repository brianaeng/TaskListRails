class Task < ActiveRecord::Base
  def completed?
    self.completed_at == nil ? self.completed_at = Time.now : self.completed_at = nil

    self.save
  end
end
