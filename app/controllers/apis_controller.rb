class ApisController < ApplicationController
  # protect_from_forgery with: :null_session
  protect_from_forgery except: [:create]
  before_action :set_api, only: %i[show edit update destroy]

  # GET /apis
  # GET /apis.json
  def index
    # @apis = Api.all
  end

  # GET /apis/1
  # GET /apis/1.json
  def show; end

  # GET /apis/new
  def new
    @api = Api.new
  end

  # GET /apis/1/edit
  def edit; end

  # POST /apis
  # POST /apis.json
  def create
    @api = Api.new(api_params)
    respond_to do |format|
      if @api.save
        format.json { render :show, status: :created }
      else
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apis/1
  # PATCH/PUT /apis/1.json
  def update
    @api = Api.new(api_params)
    respond_to do |format|
      if @api.update(api_params)
        format.html { redirect_to @api, notice: 'Api was successfully updated.' }
        format.json { render :show, status: :ok, location: @api }
      else
        format.html { render :edit }
        format.json { render json: @api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apis/1
  # DELETE /apis/1.json
  def destroy
    @api.destroy
    respond_to do |format|
      format.html { redirect_to apis_url, notice: 'Api was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_api
    @api = Api.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def api_params
    params.require(:api).permit(:host, :path, :hash_i, location: [])
  end
end
