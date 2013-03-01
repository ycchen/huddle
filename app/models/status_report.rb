class StatusReport < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessible :invoke, :rspec, :status_date, :today, :yesterday
end
