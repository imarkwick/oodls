class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_current_charity

  def set_current_charity
    if charity_signed_in?
      @current_charity = current_charity
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    these = ([
      :current_password,
      :organisation,
      :description,
      :website_url,
      :logo,
      :contact_name,
      :full_address,
      :postcode,
      :email,
      :password,
      :password_confirmation,
      :weekday_opening_hours,
      :weekend_opening_hours,
      :tins,
      :dried_goods,
      :coffee_and_tea,
      :fresh_fruit_and_veg,
      :fresh_meat_and_fish,
      :snacks,
      :jars_and_condiments,
      :cereals,
      :cooking_ingredients,
      :drinks,
      :uht_milk,
      :none
    ])
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(these) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(these) }
  end

  def after_sign_in_path_for(resource_or_scope)
  	if resource_or_scope.is_a?(Charity)
  		charity_path
  	else
  		super
  	end
  end

end
