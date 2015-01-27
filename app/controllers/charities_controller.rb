class CharitiesController < ApplicationController

  def index
    if params[:search]
      @charities = Charity.search(params[:search]).order("organisation ASC")
    else
      @charities = Charity.all.order("organisation ASC")
    end
  end

  def show
    @charity = Charity.find(params[:id])
  end

end
