require 'date'

class ApplicationsController < ApplicationController

  def index
    @applications = current_user.applications # get all applications for the current user
    @date = Date.today
  end

  def show
    @application = Application.find(params[:id])
    @status_color = @application.status == 'Accepted' ? 'green' : @application.status == 'Rejected' ? 'red' : 'orange'
    @date = Date.today
  end

  def new
    @application = Application.new
    @user = current_user
  end

  def create
    @application = Application.new(application_params)
    @application.user = current_user
    if @application.save
      redirect_to application_path(@application)
    else
      render :new
    end
  end

  def edit
    @application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    @application.update(application_params)
    redirect_to application_path(@application)
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy
    redirect_to applications_path
  end

  private

  def application_params
    params.require(:application).permit(:company, :status, :link, :date)
  end
end
