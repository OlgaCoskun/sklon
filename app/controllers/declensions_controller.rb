class DeclensionsController < ApplicationController
  before_action :set_declension, only: [:show, :edit, :update, :destroy]

  # GET /declensions
  # GET /declensions.json
  def index
    @declensions = Declension.all
  end

  # GET /declensions/1
  # GET /declensions/1.json
  def show
  end

  # GET /declensions/new
  def new
    # @declension = Declension.new
    @declension = @declensions.build
  end

  # GET /declensions/1/edit
  def edit
  end

  # POST /declensions
  # POST /declensions.json
  def create
    @declension = Declension.new(declension_params)

    respond_to do |format|
      if @declension.save
        format.html { redirect_to @declension, notice: 'Declension was successfully created.' }
        format.json { render :show, status: :created, location: @declension }
      else
        format.html { render :new }
        format.json { render json: @declension.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /declensions/1
  # PATCH/PUT /declensions/1.json
  def update
    respond_to do |format|
      if @declension.update(declension_params)
        format.html { redirect_to @declension, notice: 'Declension was successfully updated.' }
        format.json { render :show, status: :ok, location: @declension }
      else
        format.html { render :edit }
        format.json { render json: @declension.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /declensions/1
  # DELETE /declensions/1.json
  def destroy
    @declension.destroy
    respond_to do |format|
      format.html { redirect_to declensions_url, notice: 'Declension was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_declension
      @declension = Declension.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def declension_params
      params.require(:declension).permit(:dative, :accusative, :instrumental, :prepositional, :genitive)
    end
end
