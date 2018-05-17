class DosesController < ApplicationController

  before_action :set_dose, only: [:update, :destroy]

  def new
   @cocktail = Cocktail.find(params[:cocktail_id])
   @dose = Dose.new
   @ingredients = Ingredient.all
 end

 def create
   @dose = Dose.new(dose_params)
   @cocktail = Cocktail.find(params[:cocktail_id])
   @dose.cocktail = @cocktail
   if @dose.save
     redirect_to cocktail_dose_path(@cocktail)
   else
     render :new
   end
 end


  def destroy
   @dose = Dose.find(params[:id])
   cocktail = @dose.cocktail
   @dose.destroy
   redirect_to cocktail_dose_path(cockail)
 end


  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end

