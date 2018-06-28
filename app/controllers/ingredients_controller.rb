class IngredientsController < ApplicationController

  before_action :set_dose, only: [:update, :destroy]

  def new
    @ingredient = Ingredient.new(ingredient_params)
    @ingredient.save
    @ingredients = Ingredient.all.order(:name)
  end

  def create
  end


  def destroy
    if @ingredient.cocktail
      redirect_to ingredients_path(@ingredient)
    else
      @ingredient.destroy
    end

  end


  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end

  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
