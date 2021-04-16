class HomeController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index]
  before_action :authenticate_user!, except: :index

  def index
    render 'home'
  end

end