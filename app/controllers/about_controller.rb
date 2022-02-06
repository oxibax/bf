class AboutController < ApplicationController
  def index
    @goals = Goal.all
  end
end
