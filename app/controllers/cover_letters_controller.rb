class CoverLettersController < ApplicationController

  def index
    @cover_letters = current_user.cover_letters # get all cover letters for the current user
  end

  def new
    @cover_letter = CoverLetter.new
  end

  def create
    @cover_letter = current_user.cover_letters.build(cover_letter_params)
    if @cover_letter.save
      redirect_to cover_letters_path
    else
      render :new
    end
  end

  def show
    @cover_letter = CoverLetter.find(params[:id])
  end

  def edit
    @cover_letter = CoverLetter.find(params[:id])
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
    params.require(:cover_letter).permit(:title, :content)
  end
end
