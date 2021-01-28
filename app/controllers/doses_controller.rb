class DosesController < ApplicationController
  before_action :get_cocktail, only: [ :create, :new ]

  def create
    ingredient = Ingredient.find(dose_params["ingredient_id"])
    dose = @cocktail.doses.create(dose_params)
    if dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def new
    @dose = @cocktail.doses.new
  end

  def destroy
    dose = Dose.find(params[:id])
    dose.destroy

    redirect_to cocktail_path(dose.cocktail_id)
  end
  
  private 
  def dose_params
    params.require(:dose).permit(:description,:ingredient_id)
  end

  def get_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
