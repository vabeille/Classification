class CartonsController < ApplicationController
  before_action :set_carton, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  def index
    @cartons = policy_scope(Carton)
   if params[:query].present?
      sql_query = " \
        cartons.matiere ILIKE :query \
        OR cartons.annee ILIKE :query \
        OR cartons.localisation ILIKE :query \
        OR dossiers.sujet ILIKE :query \
        OR dossiers.client ILIKE :query
      "
      @cartons = Carton.joins(:dossiers).order(sort_column + " " + sort_direction).where(sql_query, query: "%#{params[:query]}%")
    else
      @cartons = Carton.none
    end
  end

  # def index
  #   @cartons = policy_scope(Carton)
  #   @cartons = Carton.order(params[:sort]).order(sort_column + " " + sort_direction)
  # end

  def show
  end

  def new
    @carton = Carton.new
    authorize @carton
  end

  def create
    @carton = current_user.cartons.build(allowed_params)

    # Will raise ActiveModel::ForbiddenAttributesError
    authorize @carton
    if @carton.save
      render action: 'show', notice: "Le carton a été enregistré avec succès !"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @carton.update(allowed_params)
      render action: 'show', notice: "Le carton a été mis à jour !"
    else
      render :edit
    end

    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    if @carton.destroy
      redirect_to cartons_path, notice: "Le carton a été supprimé avec succès !"
    else
      render :show
    end
    # no need for app/views/cartons/destroy.html.erb
  end


  private

  def allowed_params
    params.require(:carton).permit(:matiere, :annee, :chrono, :localisation, :sensible)
  end

  def set_carton
    @carton = Carton.find(params[:id])
    authorize @carton
  end

  def sort_column
    Carton.column_names.include?(params[:sort]) ? params[:sort] : "matiere"
    # Carton.column_names.include?(params[:sort]) ? params[:sort] : "annee"
    # Carton.column_names.include?(params[:sort]) ? params[:sort] : "localisation"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end

