class CoverLetterEntriesController < ApplicationController

  def new
    @cover_letter_entry = CoverLetterEntry.new
  end

  def create
    @cover_letter_entry = CoverLetterEntry.new(cover_letter_entry_params)
    if @cover_letter_entry.save
      redirect_to coverletter_path
    else
      render :new
    end
  end

  def edit
    @cover_letter_entry = CoverLetterEntry.find(params[:id])
  end

  def update
    @cover_letter_entry = CoverLetterEntry.find(params[:id])
    if @cover_letter_entry.update(cover_letter_entry_params)
      redirect_to coverletter_path
    else
      render :edit
    end
  end

  def destroy
    @cover_letter_entry = CoverLetterEntry.find(params[:id])
    @cover_letter_entry.destroy
    redirect_to coverletter_path
  end

  private

  def cover_letter_entry_params
    params.require(:cover_letter_entry).permit(:text)
  end
end
