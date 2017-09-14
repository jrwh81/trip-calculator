class HomeController < ApplicationController
  skip_before_filter :require_no_authentication, only: [:index] 
  def index
  end

end
