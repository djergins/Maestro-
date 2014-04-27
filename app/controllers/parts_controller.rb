class PartsController < ApplicationController
  before_action :set_library

  def index
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.find(params[:piece_id])
    @parts = @piece.parts
  end

  def new
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.find(params[:piece_id])
    @part = @piece.parts.new
  end

  def create
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.find(params[:piece_id])
    @parts = @piece.parts
    @part = @piece.parts.new(part_params)
    if @part.save
      flash[:success] = "Part Created!"
      redirect_to library_piece_parts_path(@library.id, @piece.id)
    else
      flash[:alert] = "Part name can't be blank"
      redirect_to new_library_piece_part_path
    end
  end

  def edit
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.find(params[:piece_id])
    @part = @piece.parts.find(params[:id])
  end

  def update
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.find(params[:piece_id])
    @part = @piece.parts.find(params[:id])
    if @part.update_attributes(part_params)
      flash[:success] = "Part updated"
      redirect_to library_piece_parts_path(@library.id, @piece.id)
    else
      flash[:alert] = "Part name can't be blank"
      redirect_to edit_library_piece_part_path
    end
  end

  def destroy
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.find(params[:piece_id])
    @part = @piece.parts.find(params[:id]).destroy
    flash[:success] = "Part Deleted!"
    redirect_to library_piece_parts_path(@library.id, @piece.id)
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
