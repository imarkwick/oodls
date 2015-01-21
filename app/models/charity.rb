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

  def requirements_array
    food_reqs = %w(tins dried_goods coffee_tea fresh_fruit_veg snacks jars_condiments cereals cooking_ingredients drinks uht_milk)

    food_reqs.inject([]) do |memo, col|
      if (self[col] == "1")
        memo << { :label => col.humanize, :id => col }
      end
      memo
    end
  end

  def self.format_for_map
    Charity.all.map do |charity|
      {
        :lat => charity.latitude,
        :lon => charity.longitude,
        :organisation => charity.organisation,
        :requirements => charity.requirements_array
      }
    end.to_json
  end

end
