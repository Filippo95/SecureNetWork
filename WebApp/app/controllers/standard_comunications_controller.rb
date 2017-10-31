class StandardComunicationsController < ApplicationController
  before_action :set_standard_comunication, only: [:show, :edit, :update, :destroy]

  # GET /standard_comunications
  # GET /standard_comunications.json
  def index
    @standard_comunications = StandardComunication.all
  end

  # GET /standard_comunications/1
  # GET /standard_comunications/1.json
  def show
  end

  # GET /standard_comunications/new
  def new
    @standard_comunication = StandardComunication.new
  end

  # GET /standard_comunications/1/edit
  def edit
  end

  # POST /standard_comunications
  # POST /standard_comunications.json
  def create
    @standard_comunication = StandardComunication.new(standard_comunication_params)

    respond_to do |format|
      if @standard_comunication.save
        format.html { redirect_to @standard_comunication, notice: 'Standard comunication was successfully created.' }
        format.json { render :show, status: :created, location: @standard_comunication }
      else
        format.html { render :new }
        format.json { render json: @standard_comunication.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /standard_comunications/1
  # PATCH/PUT /standard_comunications/1.json
  def update
    respond_to do |format|
      if @standard_comunication.update(standard_comunication_params)
        format.html { redirect_to @standard_comunication, notice: 'Standard comunication was successfully updated.' }
        format.json { render :show, status: :ok, location: @standard_comunication }
      else
        format.html { render :edit }
        format.json { render json: @standard_comunication.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /standard_comunications/1
  # DELETE /standard_comunications/1.json
  def destroy
    @standard_comunication.destroy
    respond_to do |format|
      format.html { redirect_to standard_comunications_url, notice: 'Standard comunication was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_standard_comunication
      @standard_comunication = StandardComunication.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def standard_comunication_params
      params.require(:standard_comunication).permit(:date, :data, :source, :destination, :protocol, :host)
    end
end
