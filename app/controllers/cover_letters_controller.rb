class CoverLettersController < ApplicationController  # define the cover letters controller
  # defining all of the actions for the cover letters controller

  def index
    @cover_letters = current_user.cover_letters.select { |e| e.is_saved == true } # get all cover letters for the current user  that are saved
  end

  def new
    @cover_letter = CoverLetter.new
  end

  def create
    @current_cover_letter = current_user.cover_letters.find { |e| e.is_saved == false } # get the cover letter that is not saved
    @cover_letter = CoverLetter.new(cover_letter_params)  # create a new cover letter with the params
    @cover_letter.user = current_user # assign the current user to the cover letter
    @cover_letter.is_saved = true # assign the cover letter to be saved
    @current_cover_letter.cover_letter_entries.each do |entry| # get all cover letter entries from the current cover letter
      @cover_letter_entry = CoverLetterEntry.new( # create a new cover letter entry
        text: entry.text, # assign the text from the current cover letter entry to the new cover letter entry
        cover_letter: @cover_letter # assign the new cover letter to the cover letter entry
      )
      @cover_letter_entry.save! # save the cover letter entry
    end
    if @cover_letter.save # save the cover letter
      redirect_to cover_letters_path  # redirect to the cover letters path if the cover letter is saved
    else
      render :new # render the new template if the cover letter is not saved
    end
  end

  def show
    @user = current_user # get the current user
    @cover_letter = CoverLetter.find(params[:id]) # get the cover letter with the id from the params
    respond_to do |format|  # respond to the format of the request  (html or pdf) with the format block
      format.pdf do # if the format is pdf
        render pdf: "my_cover_letter", template: "cover_letters/cl_pdf", formats: :html, page_sitze: 'a4' # render the pdf template for the cover letter
      end
    end
  end

  def update
    @cover_letter = CoverLetter.find(params[:id]) # get the cover letter with the id from the params
    if @cover_letter.update(cover_letter_params)  # update the cover letter with the params
      redirect_to cover_letters_path  # redirect to the cover letters path
    else
      render :edit  # render the edit template if the cover letter is not updated
    end
  end

  def destroy
    @cover_letter = CoverLetter.find(params[:id]) # get the cover letter with the id from the params
    @cover_letter.destroy # destroy the cover letter
    redirect_to cover_letters_path  # redirect to the cover letters path
  end

  private # private methods for the cover letters controller to use

  def cover_letter_params # define the cover letter params for the cover letters controller
    params.require(:cover_letter).permit(:name, :company) # require the cover letter params
  end
end
