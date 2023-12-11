class ResumesController < ApplicationController

  def index
    @resumes = current_user.resumes.select { |e| e.is_saved == true }  # get all resumes for the current user
  end
end
