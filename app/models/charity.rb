class Charity < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :logo,
    :styles => { :thumb => "200x200" },
    :default_url => "/images/oodls-placeholder.svg"
	validates_attachment_content_type :logo, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :organisation, :postcode, :full_address

  geocoded_by :address
  after_validation :geocode

  scope :cereals, -> value { where(cereals: value) }
  scope :coffee_and_tea, -> value { where(coffee_and_tea: value) }
  scope :cooking_ingredients, -> value { where(cooking_ingredients: value) }
  scope :dried_goods, -> value { where(dried_goods: value) }
  scope :drinks, -> value { where(drinks: value) }
  scope :fresh_fruit_and_veg, -> value { where(fresh_fruit_and_veg: value) }
  scope :jars_and_condiments, -> value { where(jars_and_condiments: value) }
  scope :fresh_meat_and_fish, -> value { where(fresh_meat_and_fish: value) }
  scope :snacks, -> value { where(snacks: value) }
  scope :tins, -> value { where(tins: value) }
  scope :uht_milk, -> value { where(uht_milk: value) }

  def address
    [full_address, postcode].compact.join(', ')
  end

  def requirements_array
    @food_reqs = %w(tins dried_goods coffee_and_tea fresh_fruit_and_veg snacks jars_and_condiments cereals cooking_ingredients drinks uht_milk fresh_meat_and_fish)

    @food_reqs.inject([]) do |memo, col|
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
    where("lower(organisation) like ?", "%#{query.downcase}%")
    # where("soundex(organisation) like soundex(?)", "%#{query.downcase}%")
  end

end
