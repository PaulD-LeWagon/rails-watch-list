class ListsController < ApplicationController
  def index
    @list = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @new_list = List.new(get_params)
    if @new_list.save
      redirect_to lists_path, status: :see_other
    else
      redirect_to new_list_path, status: :unprocessable_entity
    end
  end

  private

  def get_params
    params.require(:list).permit(:name)
  end
end
