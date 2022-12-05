class MorososController < ApplicationController
  before_action :set_moroso, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /morosos or /morosos.json
  def index
    @morosos = Moroso.all.where("lower(nombre) LIKE ?", "%#{params[:word_search]}%").or(Moroso.all.where("lower(apellido) LIKE ?", "%#{params[:word_search]}%"))
  end

  # GET /morosos/1 or /morosos/1.json
  def show
  end

  # GET /morosos/new
  def new
    #@moroso = Moroso.new
    @moroso = current_user.morosos.build
  end

  # GET /morosos/1/edit
  def edit
  end

  # POST /morosos or /morosos.json
  def create
    #@moroso = Moroso.new(moroso_params)
    @moroso = current_user.morosos.build(moroso_params)

    respond_to do |format|
      if @moroso.save
        format.html { redirect_to moroso_url(@moroso), notice: "Nuevo moroso añadido a la lista" }
        format.json { render :show, status: :created, location: @moroso }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @moroso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /morosos/1 or /morosos/1.json
  def update
    respond_to do |format|
      if @moroso.update(moroso_params)
        format.html { redirect_to moroso_url(@moroso), notice: "Los cambios se han realizado correctamente" }
        format.json { render :show, status: :ok, location: @moroso }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @moroso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /morosos/1 or /morosos/1.json
  def destroy
    @moroso.destroy

    respond_to do |format|
      format.html { redirect_to morosos_url, notice: "El moroso ha pagado su deuda" }
      format.json { head :no_content }
    end
  end

  def correct_user
    @moroso = current_user.morosos.find_by(id: params[:id])
    redirect_to morosos_path, notice: "No Estás Autorizado Para Editar a Este Moroso" if @moroso.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moroso
      @moroso = Moroso.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def moroso_params
      params.require(:moroso).permit(:nombre, :apellido, :deuda, :fecha, :direccion, :user_id)
    end
end
