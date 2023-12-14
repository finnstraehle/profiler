class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about ]

  def home
  end

  def cover_letter
    @user = current_user # get the current user
    @cover_letter = current_user.cover_letters.find { |e| e.is_saved == false } # get the cover letter that is not saved
  end

  def cv
    @user = current_user # get the current user
    @resume = current_user.resumes.find { |e| e.is_saved == false } # get the cover letter that is not saved
  end

  def about
  end
end
