class CharitiesController < ApplicationController

  has_scope :cereals
  has_scope :coffee_and_tea
  has_scope :cooking_ingredients
  has_scope :dried_goods
  has_scope :drinks
  has_scope :fresh_fruit_and_veg
  has_scope :jars_and_condiments
  has_scope :fresh_meat_and_fish
  has_scope :snacks
  has_scope :tins
  has_scope :uht_milk

  def index
    if params[:search]
      @charities = Charity.search(params[:search]).order("organisation ASC")
    else
      @charities = apply_scopes(Charity).all.order("organisation ASC")
    end
  end

  def show
    @charity = Charity.find(params[:id])
  end

end
