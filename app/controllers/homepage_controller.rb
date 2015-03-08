class HomepageController < ApplicationController
  def show
    @clubs = Club.all
  end
end
