class Project < ActiveRecord::Base
  attr_accessible :name, :user_ids

  has_many :projects_users
  has_many :users, :through => :projects_users, :dependent => :delete_all


  def user_ids=(params)
  	self.users=[]
  	params.each do |id|
  		unless id.to_s.empty?
  			user = User.find(id)
  			users << user
  		end
  		save
  	end
  end 
  
end
