class PiecesController < ApplicationController
  def new
    @piece = Piece.new
  end

  def create
    @piece = current_user.libraries.pieces.build(piece_params)
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
  end

  private 

    def piece_params
      params.require(:piece).permit(:name, :composer, :arranger, :library_number,
                                    :key, :grade)
    end
end
