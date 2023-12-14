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
    if @cover_letter.save
      redirect_to cover_letters_path
    else
      render :new
    end
  end

  def show
    @user = current_user # get the current user
    @cover_letter = current_user.cover_letters.find { |e| e.is_saved == false } # get the cover letter that is not saved
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
