class Charity < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessor :organisation, :description, :contact_name, :postcode, :full_address

  has_attached_file :logo, 
	:styles => { :thumb => "200x200" }, 
	:default_url => "/images/:style/missing.png" 
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

	

end
