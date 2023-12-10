class CoverLettersController < ApplicationController

  def index
    @cover_letters = CoverLetter.all
  end
end
