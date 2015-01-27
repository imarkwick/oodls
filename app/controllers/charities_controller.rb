class CharitiesController < ApplicationController

  def index
    if params[:search]
      @charities = Charity.search(params[:search])#.order("created_at DESC")
    else
      @charities = Charity.all#.order('created_at DESC')
    end
  end

  def show
    @charity = Charity.find(params[:id])
  end


end
