class ResumesController < ApplicationController # define the resumes controller
  # defining all of the actions for the resumes controller

  def index
    @resumes = current_user.resumes.select { |e| e.is_saved == true }  # get all resumes for the current user that are saved
  end

  def new
    @resume = Resume.new  # create a new resume
  end

  def create
    @current_resume = current_user.resumes.find { |e| e.is_saved == false } # get the resume that is not saved
    @resume = Resume.new(resume_params) # create a new resume with the params
    @resume.user = current_user # assign the current user to the resume
    @resume.is_saved = true # assign the resume to be saved
    @current_resume.resume_entries.each do |entry| # get all resume entries from the current resume
      @resume_entry = ResumeEntry.new( # create a new resume entry
        title: entry.title, # assign the title from the current resume entry to the new resume entry
        subtitle: entry.subtitle, # assign the subtitle from the current resume entry to the new resume entry
        location: entry.location, # assign the location from the current resume entry to the new resume entry
        start: entry.start, # assign the start date from the current resume entry to the new resume entry
        end: entry.end, # assign the end date from the current resume entry to the new resume entry
        section: entry.section, # assign the section from the current resume entry to the new resume entry
        bullet_one: entry.bullet_one, # assign the first bullet point from the current resume entry to the new resume entry
        bullet_two: entry.bullet_two, # assign the second bullet point from the current resume entry to the new resume entry
        resume: @resume # assign the new resume to the resume entry
      )
      @resume_entry.save! # save the resume entry
    end
    if @resume.save # save the resume
      redirect_to resumes_path  # redirect to the resumes path if the resume is saved
    else
      render :new # render the new template if the resume is not saved
    end
  end

  def show
    @user = current_user # get the current user
    @resume = Resume.find(params[:id]) # get the resume with the id from the params
    @entries_s1 = @resume.resume_entries.where(section: 1).sort_by { |e| e.end }.reverse # get the resume_entries for section 1
    @entries_s2 = @resume.resume_entries.where(section: 2).sort_by { |e| e.end }.reverse # get the resume_entries for section 2
    @entries_s3 = @resume.resume_entries.where(section: 3).sort_by { |e| e.end }.reverse # get the resume_entries for section 3
    respond_to do |format|  # respond to the format of the request  (html or pdf) with the format block
      format.pdf do # if the format is pdf
        render pdf: "my_resume", template: "resumes/cv_pdf", formats: :html, page_sitze: 'a4' # render the pdf template for the resume
      end
    end
  end

  def update
    @resume = Resume.find(params[:id])  # get the resume with the id from the params
    if @resume.update(resume_params)  # update the resume with the params
      redirect_to resumes_path  # redirect to the resumes path
    else
      render :edit  # render the edit template if the resume is not updated
    end
  end

  def destroy
    @resume = Resume.find(params[:id])  # get the resume with the id from the params
    @resume.destroy # destroy the resume
    redirect_to resumes_path  # redirect to the resumes path
  end

  private # private methods for the resumes controller to use

  def resume_params # define the resume params for the resumes controller
    params.require(:resume).permit(:name, :company) # require the resume params 
  end
end
