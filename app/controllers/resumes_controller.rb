class ResumesController < ApplicationController

  def index
    @resumes = current_user.resumes # get all resumes for the current user
  end
end
