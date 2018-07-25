class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]

  # GET /listings
  # GET /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1
  # GET /listings/1.json
  def show; end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit; end

  def registar
    @listing = Listing.new
  end

  def edit1
    @listings = Listing.all
    @listing = Listing.find(params[:id])
  end

  def options
    @listings = Listing.all
    @listing = nil
    # @current_listing = Listing.find_by(creative_name: params[:creative_name])
  end

  def setting
    @listings = Listing.all
    @listing = nil
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.listing_user = current_user.user_id
    respond_to do |format|
      if @listing.save
        format.html { redirect_to '/listings/registar', notice: 'クリエイティブを登録しました。' }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to "/listings/#{@listing.id}/edit1", notice: 'クリエイティブを編集しました。' }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to '/listings/options', notice: 'クリエイティブを削除しました。' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def listing_params
    params.require(:listing).permit(:listing_code, :creative_name, :ad_name, :ad_parameter, :kahen_selector)
  end
end
