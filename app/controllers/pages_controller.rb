class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :cows ]
  def home
  end
end
