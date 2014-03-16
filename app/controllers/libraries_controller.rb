class LibrariesController < ApplicationController
  before_action :correct_user,   only: :destroy

  def new
    @library = Library.new
  end

  def create
    @library = current_user.libraries.build(library_params)
    if @library.save
      flash[:success] = "Library Created!"
      redirect_to current_user
    else
      render 'front_pages/home'
    end
  end

  def show
    @library = Library.find(params[:id])
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
