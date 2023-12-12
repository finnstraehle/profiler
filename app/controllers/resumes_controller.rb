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
    @resume.section_one = @current_resume.section_one
    @resume.section_two = @current_resume.section_two
    @resume.section_three = @current_resume.section_three
    if @resume.save
      redirect_to resumes_path
    else
      render :new
    end
  end

  def show
    @user = current_user # get the current user
    @resume = current_user.resumes.find { |e| e.is_saved == false } # get the resume that is not saved
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
