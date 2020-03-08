class CartonsController < ApplicationController
  def index
    @cartons = Carton.all
  end

  def show
    @carton = Carton.find(params[:id])
  end

  def new
    @carton = Carton.new
  end

  def create
    @carton = Carton.new(allowed_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    @carton.save
    redirect_to carton_path(@carton)
  end

  def edit
    @carton = Carton.find(params[:id])
  end

  def update
    @carton = Carton.find(params[:id])
    @carton.update(allowed_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to carton_path(@carton)
  end

  def destroy
    @carton = Carton.find(params[:id])
    @carton.destroy

    # no need for app/views/cartons/destroy.html.erb
    redirect_to cartons_path
  end

  private

  def allowed_params
    params.require(:carton).permit(:matiere, :annee, :chrono, :localisation)
  end
end

