class WorksController < ApplicationController
  def home
    @homepage = true
    
    @spotlight = Work.first
    @books = Work.where(category: "book").limit(10)
    @movies = Work.where(category: "movie").limit(10)
    @albums = Work.where(category: "album").limit(10)
  end

  def index
    @works = Work.all
  end

  def show
    @work = Work.find_by(id: params[:id].to_i)
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new work_params
    if @work.save
      flash[:success] = "Item successfully added"
      redirect_to root_path
    else
      flash.now[:success] = "Item could not be added"
      render :new
    end
  end

  def edit
    @work = Work.find_by(id: params[:id].to_i)

    unless @work
      redirect_to root_path
    end
  end

  def update
    @work = Work.find_by(id: params[:id].to_i)
    redirect_to works_path unless @work

    if @work.update_attributes work_params
      flash[:success] = "Item successfully updated"
      redirect_to works_path
    else
      flash.now[:success] = "Item failed to update"
      render :edit
    end
  end

  def destroy
    Work.find_by(id: params[:id]).destroy
    flash[:success] = "Item deleted"
    redirect_to root_path
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
