class DrinksController < ApplicationController

  def index
    @drink=Drink.all
  end

  def show
      @drink = Drink.find(params[:id])
  end

  def new  # display the new record
    @drink = Drink.new
  end

  def create  # save the new record
    @drink= Drink.new(allowed_params)
    if @drink.save
      redirect_to drinks_path
    else
      redender 'new'
    end
  end

  def edit  # display the existing record
      @drink = Drink.find(params[:id])
  end

  def update  # save changes
    @drink = Drink.find(params[:id])
    if @drink.update(allowed_params)
      redirect_to drinks_path
    else
      redender 'new'
    end
  end

  def destroy # delete
      @drink = Drink.find(params[:id])
        @drink.destroy
        redirect_to drinks_path
  end

  private
  def allowed_params
    params.require(:drink).permit(:name, :size)
  end

end
