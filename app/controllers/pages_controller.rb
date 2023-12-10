class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def cover_letter
    @user = current_user # get the current user
    @cover_letter = CoverLetter.find { |e| e.is_saved == false } # get the cover letter that is not saved
  end
end
