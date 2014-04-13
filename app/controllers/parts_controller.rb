class PartsController < ApplicationController
  before_action :set_library
  def new
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.find(params[:piece_id])
    @part = @piece.parts.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private
    def set_library
      @library = Library.find(params[:library_id]) 
    end

    def part_params
      params.require(:part).permit(:piece, :name)
    end
end
