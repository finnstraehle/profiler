class ResumeEntriesController < ApplicationController

  def new
    @resume_entry = ResumeEntry.new
  end

  def create
    @resume_entry = ResumeEntry.new(resume_entry_params)
    if @resume_entry.save
      redirect_to cv_path
    else
      render :new
    end
  end

  def edit
    @resume_entry = ResumeEntry.find(params[:id])
  end

  def update
    @resume_entry = ResumeEntry.find(params[:id])
    if @resume_entry.update(resume_entry_params)
      redirect_to cv_path
    else
      render :edit
    end
  end

  def destroy
    @resume_entry = ResumeEntry.find(params[:id])
    @resume_entry.destroy
    redirect_to cv_path
  end

  private

  def resume_entry_params
    params.require(:resume_entry).permit(:section, :title, :subtitle, :location, :bullet_one, :bullet_two, :start, :end)
  end
end
