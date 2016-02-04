class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
    @album = Album.find(params[:album_id])
  end

  # GET /images/1
  # GET /images/1.json
  def show
    @album = Album.find(params[:album_id])
  end

  # GET /images/new
  def new
    @image = Image.new
    @album = Album.find(params[:album_id])
  end

  # GET /images/1/edit
  def edit
    @album = Album.find(params[:album_id])
  end

  # POST /images
  # POST /images.json
  def create
    @album = Album.find(params[:album_id])
    @image = Image.new(image_params)
    respond_to do |format|
      if @image.save
        binding.pry
        format.html { redirect_to album_image_path(@album,@image), notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    @album = Album.find(params[:album_id])
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to edit_album_image_path(@album,@image), notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @album = Album.find(params[:album_id])
    @image.destroy
    respond_to do |format|
      format.html { redirect_to album_image_path(@album,@image), notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :image, :remove_image)
    end
end
