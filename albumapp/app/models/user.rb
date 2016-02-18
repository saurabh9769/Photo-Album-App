class User < ActiveRecord::Base
	  
	# before_action :authenticate_user!
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable
	
	has_many :albums
	has_many :images, through: :albums


	# validates_format_of :name, :with => /[A-Za-z]+/, :on => :create
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
	validates_length_of :password, :minimum => 5, :on => :create

end
