class PiecesController < ApplicationController
  before_action :set_library

  def index
    @library = Library.find(params[:library_id])
    @pieces =  @library.pieces
    @piece = Piece.new(:library=>@library)
    render layout: "pieces"
  end

  def new
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.new
  end

  def create
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.new(piece_params)
    respond_to do |format|
      if @piece.save
        format.html { redirect_to @piece , notice: 'Piece was successfully created.' }
        format.json { render action: 'show', status: :created, location: [@library, @piece] }
        format.js   { render action: 'show', status: :created, location: [@library, @piece] }
      else
        format.html { render action: 'new' }
        format.json { render json: @piece.errors, status: :unprocessable_entity}
        format.js   { render json: @piece.errors, status: :unprocessable_entity}
      end
    end
  end

  def show
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.find(params[:id])
    render layout: "application"
  end

  def edit
    render layout: "application"
  end

  def destroy
    @library = Library.find(params[:library_id])
    @piece = @library.pieces.find(params[:id])
    @piece.destroy
    flash[:success] = "Piece Deleted!"
    redirect_to library_path(@library)
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
