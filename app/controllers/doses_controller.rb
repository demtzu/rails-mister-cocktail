class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.save
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    cockt = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(cockt)

    # @dose = Dose.find(params[:id])
    # @dose.cocktail = @cocktail
    # @dose.delete
    # redirect_to cocktail_path(params[:cocktail_id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
