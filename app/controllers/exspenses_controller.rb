class ExspensesController < ApplicationController
  before_action :set_exspense, only: [:show, :edit, :update, :destroy]

  # GET /exspenses
  # GET /exspenses.json
  def index
    @exspenses = Exspense.all
  end

  # GET /exspenses/1
  # GET /exspenses/1.json
  def show
  end

  # GET /exspenses/new
  def new
    @exspense = Exspense.new
  end

  # GET /exspenses/1/edit
  def edit
  end

  # POST /exspenses
  # POST /exspenses.json
  def create
    @exspense = Exspense.new(exspense_params)

    respond_to do |format|
      if @exspense.save
        format.html { redirect_to @exspense, notice: 'Exspense was successfully created.' }
        format.json { render :show, status: :created, location: @exspense }
      else
        format.html { render :new }
        format.json { render json: @exspense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exspenses/1
  # PATCH/PUT /exspenses/1.json
  def update
    respond_to do |format|
      if @exspense.update(exspense_params)
        format.html { redirect_to @exspense, notice: 'Exspense was successfully updated.' }
        format.json { render :show, status: :ok, location: @exspense }
      else
        format.html { render :edit }
        format.json { render json: @exspense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exspenses/1
  # DELETE /exspenses/1.json
  def destroy
    @exspense.destroy
    respond_to do |format|
      format.html { redirect_to exspenses_url, notice: 'Exspense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exspense
      @exspense = Exspense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exspense_params
      params.require(:exspense).permit(:name, :cost)
    end
end
