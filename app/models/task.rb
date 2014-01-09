class Task < ActiveRecord::Base
  attr_accessible :completed_at, :name
end
