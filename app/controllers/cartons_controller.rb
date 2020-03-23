class CartonsController < ApplicationController
  def index
   if params[:query].present?
      sql_query = " \
        cartons.matiere ILIKE :query \
        OR cartons.annee ILIKE :query \
        OR cartons.localisation ILIKE :query \
        OR dossiers.name ILIKE :query \
        OR dossiers.client ILIKE :query
      "
      @cartons = Carton.joins(:dossiers).where(sql_query, query: "%#{params[:query]}%")
    else
      @cartons = Carton.none
    end
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
    @carton.chrono = 1
    if @carton.save
      render action: 'show', notice: "Le carton a été enregistré avec succès !"
    else
      render :new
    end
  end

  def edit
    @carton = Carton.find(params[:id])
  end

  def update
    @carton = Carton.find(params[:id])
    if @carton.update(allowed_params)
      redirect_to show, notice: "Le carton a été mis à jour !"
    else
      render :edit
    end

    # Will raise ActiveModel::ForbiddenAttributesError
  end

  def destroy
    @carton = Carton.find(params[:id])
    if @carton.destroy
      redirect_to cartons_path, notice: "Le carton a été supprimé avec succès !"
    else
      render :show
    end
    # no need for app/views/cartons/destroy.html.erb
  end

  def chrono
    @carton = Carton.find(params[:carton])
    @carton.chrono += 1
    @carton.save

    if @carton.save
      respond_to do |format|
        format.html { redirect_to cartons_path }
        format.js  # <-- will render `app/views/cartons/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'cartons/index' }
        format.js  # <-- idem
      end
    end
  end

  private

  def allowed_params
    params.require(:carton).permit(:matiere, :annee, :chrono, :localisation, :sensible)
  end
end

