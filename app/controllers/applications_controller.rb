require 'date'

class ApplicationsController < ApplicationController

  def index
    @applications = current_user.applications # get all applications for the current user
    @date = Date.today
  end
end
