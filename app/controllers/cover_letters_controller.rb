class CoverLettersController < ApplicationController

  def index
    @cover_letters = current_user.cover_letters.select { |e| e.is_saved == true }
  end

  def new
    @cover_letter = CoverLetter.new
  end

  def create
    @current_cover_letter = current_user.cover_letters.find { |e| e.is_saved == false } # get the cover letter that is not saved
    @cover_letter = CoverLetter.new(cover_letter_params)
    @cover_letter.user = current_user
    @cover_letter.is_saved = true
    @current_cover_letter.cover_letter_entries.each do |entry| # get all cover letter entries from the current cover letter
      @cover_letter_entry = CoverLetterEntry.new( # create a new cover letter entry
        text: entry.text, # assign the text from the current cover letter entry to the new cover letter entry
        cover_letter: @cover_letter # assign the new cover letter to the cover letter entry
      )
      @cover_letter_entry.save! # save the cover letter entry
    end
    if @cover_letter.save
      redirect_to cover_letters_path
    else
      render :new
    end
  end

  def show
    @user = current_user # get the current user
    @cover_letter = CoverLetter.find(params[:id]) # get the cover letter with the id from the params
    respond_to do |format|
      format.pdf do
        render pdf: "my_cover_letter", template: "cover_letters/cl_pdf", formats: :html, page_sitze: 'a4'
      end
    end
  end

  def update
    @cover_letter = CoverLetter.find(params[:id])
    if @cover_letter.update(cover_letter_params)
      redirect_to cover_letters_path
    else
      render :edit
    end
  end

  def destroy
    @cover_letter = CoverLetter.find(params[:id])
    @cover_letter.destroy
    redirect_to cover_letters_path
  end

  private

  def cover_letter_params
    params.require(:cover_letter).permit(:name, :company)
  end
end
