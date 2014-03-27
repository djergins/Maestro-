class PiecesController < ApplicationController
  before_action :set_library

  def new
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.new
  end

  def create
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.create(piece_params)
    if @piece.save
      flash[:success] = "Piece Created!"
      redirect_to 'libraries/show'
    else
      render 'front_pages/home'
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @piece.destroy
    flash[:success] = "Piece Deleted!"
    redirect_to current_user
  end

  def new_piece
    respond_to do |format|
      format.html
      format.js
    end
  end

  private 

    def set_library
      @library = Library.find(params[:library_id])
    end

    def piece_params
      params.require(:piece).permit(:name, :composer, :arranger, :library_number,
                                    :key, :grade)
    end
end
