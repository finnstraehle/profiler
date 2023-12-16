class ApplicationController < ActionController::Base # define the application controller
  before_action :authenticate_user! # authenticate the user before any action
end
