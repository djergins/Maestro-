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
      redirect_to library_piece_parts_path(@library.id, @piece.id), notice: 'Part was successfully created.'
    else
      render action: 'new'
    end
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
