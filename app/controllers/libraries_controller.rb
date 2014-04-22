class LibrariesController < ApplicationController
  before_action :correct_user,   only: :destroy
  def new
    @library = Library.new
    render layout: "application"
  end

  def create
    @library = current_user.libraries.build(library_params)
    if @library.save
      flash[:success] = "Library Created!"
      redirect_to library_pieces_path(@library)
    else
      flash[:alert] = "Invalid entry for library name."
      redirect_to new_library_path
    end
  end

  def edit
    @library = Library.find(params[:id])
    render layout: "application"
  end

  def update
    @library = Library.find(params[:id])
    if @library.update_attributes(library_params)
      flash[:success] = "Library updated"
      redirect_to current_user
    else
      flash[:alert] = "Invalid entry for library name."
      redirect_to new_library_path
    end
  end

  def show
    @library = Library.find(params[:id])
    @piece = @library.piece_ids
    render layout: "libraries"
  end

  def destroy
    @library.destroy
    flash[:success] = "Library Deleted!"
    redirect_to current_user
  end

  private

    def library_params
      params.require(:library).permit(:name)
    end

    def correct_user
      @library = current_user.libraries.find_by(id: params[:id])
      redirect_to current_user if @library.nil?
    end
end
