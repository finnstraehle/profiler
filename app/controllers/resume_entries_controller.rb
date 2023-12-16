class ResumeEntriesController < ApplicationController # define the resume entries controller
  # defining all of the actions for the resume entries controller

  def new
    @resume_entry = ResumeEntry.new # create a new resume entry
  end

  def create
    @resume_entry = ResumeEntry.new(resume_entry_params)  # create a new resume entry with the params
    if @resume_entry.save # save the resume entry
      redirect_to cv_path # redirect to the cv path
    else
      render :new # render the new template if the resume entry is not saved
    end
  end

  def edit
    @resume_entry = ResumeEntry.find(params[:id]) # get the resume entry with the id from the params
  end

  def update
    @resume_entry = ResumeEntry.find(params[:id]) # get the resume entry with the id from the params
    if @resume_entry.update(resume_entry_params)    # update the resume entry with the params
      redirect_to cv_path # redirect to the cv path
    else
      render :edit  # render the edit template if the resume entry is not updated
    end
  end

  def destroy
    @resume_entry = ResumeEntry.find(params[:id]) # get the resume entry with the id from the params
    @resume_entry.destroy # destroy the resume entry
    redirect_to cv_path # redirect to the cv path
  end

  private # private methods for the resume entries controller to use

  def resume_entry_params # define the resume entry params for the resume entries controller
    params.require(:resume_entry).permit(:section, :title, :subtitle, :location, :bullet_one, :bullet_two, :start, :end)  # require the resume entry params
  end
end
