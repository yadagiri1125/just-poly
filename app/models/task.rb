class Task < ActiveRecord::Base
  attr_accessible :completed_at, :name

  def to_param
    permalink
  end

  def permalink
    "#{id}-#{name.parameterize}"
  end
end
