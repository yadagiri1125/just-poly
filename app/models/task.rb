class Task < ActiveRecord::Base
  attr_accessible :completed_at, :name
  self.locking_column = "lock_version"

  def to_param
    permalink
  end

  def permalink
    "#{id}-#{name.parameterize}"
  end
end
