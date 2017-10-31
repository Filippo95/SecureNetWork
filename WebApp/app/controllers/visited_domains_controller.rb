class VisitedDomainsController < ApplicationController
  before_action :set_visited_domain, only: [:show, :edit, :update, :destroy]

  # GET /visited_domains
  # GET /visited_domains.json
  def index
    @visited_domains = VisitedDomain.all
  end

  # GET /visited_domains/1
  # GET /visited_domains/1.json
  def show
  end

  # GET /visited_domains/new
  def new
    @visited_domain = VisitedDomain.new
  end

  # GET /visited_domains/1/edit
  def edit
  end

  # POST /visited_domains
  # POST /visited_domains.json
  def create
    @visited_domain = VisitedDomain.new(visited_domain_params)

    respond_to do |format|
      if @visited_domain.save
        format.html { redirect_to @visited_domain, notice: 'Visited domain was successfully created.' }
        format.json { render :show, status: :created, location: @visited_domain }
      else
        format.html { render :new }
        format.json { render json: @visited_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /visited_domains/1
  # PATCH/PUT /visited_domains/1.json
  def update
    respond_to do |format|
      if @visited_domain.update(visited_domain_params)
        format.html { redirect_to @visited_domain, notice: 'Visited domain was successfully updated.' }
        format.json { render :show, status: :ok, location: @visited_domain }
      else
        format.html { render :edit }
        format.json { render json: @visited_domain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /visited_domains/1
  # DELETE /visited_domains/1.json
  def destroy
    @visited_domain.destroy
    respond_to do |format|
      format.html { redirect_to visited_domains_url, notice: 'Visited domain was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_visited_domain
      @visited_domain = VisitedDomain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def visited_domain_params
      params.require(:visited_domain).permit(:host, :times)
    end
end
