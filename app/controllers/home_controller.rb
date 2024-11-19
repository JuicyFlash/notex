class HomeController < ApplicationController
  #allow_unauthenticated_access only: %i[ index ]
  def index
    #ap Current.user
  end
end
