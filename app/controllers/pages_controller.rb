class PagesController < ApplicationController # define the pages controller
  skip_before_action :authenticate_user!, only: [ :home, :about ] # skip the authenticate user before action for the home and about actions

  # defining all of the actions for the pages controller

  def home
  end

  def cover_letter
    @user = current_user # get the current user
    @cover_letter = current_user.cover_letters.find { |e| e.is_saved == false } # get the cover letter that is not saved
  end

  def cv
    @user = current_user # get the current user
    @resume = current_user.resumes.find { |e| e.is_saved == false } # get the cover letter that is not saved
    @entries_s1 = @resume.resume_entries.where(section: 1).sort_by { |e| e.end }.reverse # get the resume_entries for section 1
    @entries_s2 = @resume.resume_entries.where(section: 2).sort_by { |e| e.end }.reverse # get the resume_entries for section 2
    @entries_s3 = @resume.resume_entries.where(section: 3).sort_by { |e| e.end }.reverse # get the resume_entries for section 3
  end

  def about 
  end
end
