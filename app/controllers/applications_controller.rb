require 'date' # require the date library

class ApplicationsController < ApplicationController # define the applications controller

  # defining all of the actions for the applications controller
  def index
    @applications = current_user.applications # get all applications for the current user
    @date = Date.today # get the current date
  end

  def show
    @application = Application.find(params[:id]) # get the application with the id from the params
    @status_color = @application.status == 'Accepted' ? 'green' : @application.status == 'Rejected' ? 'red' : 'orange' # set the color for the status
    @date = Date.today # get the current date
    @cover_letter = @application.cover_letter # get the cover letter for the application
    @resume = @application.resume # get the resume for the application
  end

  def new
    @application = Application.new # create a new application
    @resumes = current_user.resumes.select { |e| e.is_saved == true }  # get all resumes for the current user that are saved
    @cover_letters = current_user.cover_letters.select { |e| e.is_saved == true }  # get all cover letters for the current user that are saved
  end

  def create
    @application = Application.new(application_params) # create a new application with the params
    @application.user = current_user # assign the current user to the application
    @application.date = Date.today # assign the current date to the application
    if @application.save # save the application
      redirect_to applications_path # redirect to the applications path if the application is saved
    else
      render :new # render the new template if the application is not saved
    end
  end

  def edit
    @application = Application.find(params[:id]) # get the application with the id from the params
    @application.date = Date.today # assign the current date to the application
    @resumes = current_user.resumes.select { |e| e.is_saved == true }  # get all resumes for the current user that are saved
    @cover_letters = current_user.cover_letters.select { |e| e.is_saved == true }  # get all cover letters for the current user that are saved
  end

  def update
    @application = Application.find(params[:id]) # get the application with the id from the params
    @application.update(application_params) # update the application with the params
    redirect_to application_path(@application) # redirect to the application path
  end

  def destroy
    @application = Application.find(params[:id]) # get the application with the id from the params
    @application.destroy  # destroy the application
    redirect_to applications_path # redirect to the applications path
  end

  private # private methods for the applications controller to use

  def application_params  # define the application params for the application controller
    params.require(:application).permit(:company, :status, :link, :date, :notes, :cover_letter_id, :resume_id)  # require the application params
  end
end
