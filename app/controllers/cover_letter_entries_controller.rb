class CoverLetterEntriesController < ApplicationController
  # defining all of the actions for the cover letter entries controller
  def new
    @cover_letter_entry = CoverLetterEntry.new  # create a new cover letter entry
  end

  def create
    @cover_letter_entry = CoverLetterEntry.new(cover_letter_entry_params) # create a new cover letter entry with the params
    if @cover_letter_entry.save   # save the cover letter entry
      redirect_to coverletter_path  # redirect to the cover letter path
    else
      render :new # render the new template if the cover letter entry is not saved
    end
  end

  def edit
    @cover_letter_entry = CoverLetterEntry.find(params[:id])  # get the cover letter entry with the id from the params
  end

  def update
    @cover_letter_entry = CoverLetterEntry.find(params[:id])  # get the cover letter entry with the id from the params
    if @cover_letter_entry.update(cover_letter_entry_params)  # update the cover letter entry with the params
      redirect_to coverletter_path  # redirect to the cover letter path
    else
      render :edit  # render the edit template if the cover letter entry is not updated
    end
  end

  def destroy
    @cover_letter_entry = CoverLetterEntry.find(params[:id])  # get the cover letter entry with the id from the params
    @cover_letter_entry.destroy # destroy the cover letter entry
    redirect_to coverletter_path  # redirect to the cover letter path
  end

  private # private methods for the cover letter entries controller to use

  def cover_letter_entry_params # define the cover letter entry params for the cover letter entries controller
    params.require(:cover_letter_entry).permit(:text) # require the cover letter entry params
  end
end
