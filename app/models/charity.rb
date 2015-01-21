class Charity < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :logo, 
	:styles => { :thumb => "200x200" }, 
	:default_url => "/images/:style/missing.png" 
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/

  geocoded_by :address
  after_validation :geocode

  def address
    [full_address, postcode].compact.join(', ')
  end

  def self.format_for_map
    Charity.all.map{|c| [c.id,c.latitude,c.longitude] }
  end

end
