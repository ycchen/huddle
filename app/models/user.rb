class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :display_name, :role
  # attr_accessible :title, :body
  has_many :status_reports
  has_many :projects_users
  has_many :projects, :through => :projects_users

  ROLES = %w[admin user]

  def avatar
  	Gravatar.new(self.email).image_url
  end

  def admin?
    self.role == 'admin'
  end
end
