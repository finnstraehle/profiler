class CoverLettersController < ApplicationController

  def index
    @cover_letters = current_user.cover_letters # get all cover letters for the current user
  end
end
