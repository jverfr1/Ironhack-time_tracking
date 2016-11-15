class SiteController < ApplicationController
  # def home
  #   render 'home'
  # end
  # def contact
  #   render 'contact'
  # end
  def calculator
  end
  def calculate
    @sum = params[:first_num].to_i + params[:second_num].to_i
  end
end
