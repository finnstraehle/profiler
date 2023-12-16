class ResumesController < ApplicationController

  def index
    @resumes = current_user.resumes.select { |e| e.is_saved == true }  # get all resumes for the current user
  end

  def new
    @resume = Resume.new
  end

  def create
    @current_resume = current_user.resumes.find { |e| e.is_saved == false } # get the resume that is not saved
    @resume = Resume.new(resume_params)
    @resume.user = current_user
    @resume.is_saved = true
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
    if @resume.save
      redirect_to resumes_path
    else
      render :new
    end
  end

  def show
    @user = current_user # get the current user
    @resume = Resume.find(params[:id]) # get the resume with the id from the params
    @entries_s1 = @resume.resume_entries.where(section: 1).sort_by { |e| e.end }.reverse # get the resume_entries for section 1
    @entries_s2 = @resume.resume_entries.where(section: 2).sort_by { |e| e.end }.reverse # get the resume_entries for section 2
    @entries_s3 = @resume.resume_entries.where(section: 3).sort_by { |e| e.end }.reverse # get the resume_entries for section 3
    respond_to do |format|
      format.pdf do
        render pdf: "my_resume", template: "resumes/cv_pdf", formats: :html, page_sitze: 'a4'
      end
    end
  end

  def update
    @resume = Resume.find(params[:id])
    if @resume.update(resume_params)
      redirect_to resumes_path
    else
      render :edit
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path
  end

  private

  def resume_params
    params.require(:resume).permit(:name, :company)
  end
end
