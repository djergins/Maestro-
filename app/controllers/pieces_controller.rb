class PiecesController < ApplicationController
  def new
    @piece = Piece.new
  end

  def create
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.create(piece_params)
    if @piece.save
      flash[:success] = "Piece Created!"
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

  private 

    def piece_params
      params.require(:piece).permit(:name, :composer, :arranger, :library_number,
                                    :key, :grade)
    end
end
