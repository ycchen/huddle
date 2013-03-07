class StatusReport < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  attr_accessible :invoke, :rspec, :status_date, :today, :yesterday, :project_id, :user_id

  validates :yesterday, :presence => true
  validates :today, :presence => true
  validates :project_id, :presence => true

end
