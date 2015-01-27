class Charity < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :logo,
    :styles => { :thumb => "200x200" },
    :default_url => "/images/oodls-placeholder.svg"
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
  validates_uniqueness_of :postcode
  validates_presence_of :organisation, :postcode, :full_address

  geocoded_by :address
  after_validation :geocode

  def address
    [full_address, postcode].compact.join(', ')
  end

  def requirements_array
    food_reqs = %w(tins dried_goods coffee_and_tea fresh_fruit_and_veg snacks jars_and_condiments cereals cooking_ingredients drinks uht_milk fresh_meat_and_fish)

    food_reqs.inject([]) do |memo, col|
      if (self[col] == "1")
        memo << { :label => col.humanize, :heading => col }
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
        :requirements => charity.requirements_array,
        :weekday_hours => charity.weekday_opening_hours,
        :weekend_hours => charity.weekend_opening_hours,
        :id => charity.id
      }
    end.to_json
  end

  def self.search(query)
    where("soundex(organisation) like soundex(?)", "%#{query.downcase}%")
  end

end
