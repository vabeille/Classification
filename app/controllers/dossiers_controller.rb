class DossiersController < ApplicationController
  before_action :set_carton
def new
    @dossier = @carton.dossiers.build
    authorize @carton
  end

  def create
    @dossier = Dossier.new(dossier_params)
    @dossier.carton = @carton
    authorize @carton
    if @dossier.save
      redirect_to carton_path(@carton)
    else
      render :new
    end
  end

  def edit
    authorize @carton
    @carton = Carton.find(params[:carton_id])
    @dossier = Dossier.find(params[:id])
  end

  def update
    authorize @carton
    @carton = Carton.find(params[:carton_id])
    @dossier = Dossier.find(params[:id])
    @dossier.update(dossier_params)
    # Will raise ActiveModel::ForbiddenAttributesError
    redirect_to carton_path(@carton)
  end

    def destroy
    authorize @carton
    # TO DO : flash notice s'affiche 2 fois
    @carton = Carton.find(params[:carton_id])
    @dossier = Dossier.find(params[:id])
    title = @dossier.sujet
    if @dossier.destroy
      flash[:notice] = "#{title} a été supprimé avec succès."
      redirect_to @carton
    else
      flash[:error] = "Impossible de supprimer"
      render :show
    end
  end

  private

  def set_carton
    @carton = Carton.find(params[:carton_id])
  end

  def dossier_params
    params.require(:dossier).permit(:sujet, :client, :sensible)
  end
end
