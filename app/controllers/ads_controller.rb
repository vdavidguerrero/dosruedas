class AdsController < ApplicationController

  before_action :confirm_logged_in
  def index
    @ads = Ad.all
  end

  def delete
    Ad.find(params[:id]).destroy
    redirect_to controller: :ads , action: :showAds
  end

  def create
    @ad = Ad.new(ad_params)
    if @ad.save
      upload(params[:ad][:photo1], "pepe")
      upload(params[:ad][:photo2], "pepe")
      upload(params[:ad][:photo3], "pepe")
      redirect_to controller: "ads", action: "show", id:@ad.id

    else
      @vehicles = Vehicle.all
      flash[:mm] = @ad.errors.messages
      render 'new'
    end
  end

  def new
  @vehicles = Vehicle.all
    Vehicle.find_by_model_id(Model.find(1).id)
  end

  def show
    @ad = Ad.find(params[:id])

  end

  def showAds
    @ads = User.find(session[:user_id]).ads
  end

  private

  def upload(uploaded_io, description)
    File.open(Rails.root.join('app','assets', 'images', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
      Picture.create(path:uploaded_io.original_filename.to_s, descripcion:description, ad_id:@ad.id)
    end
  end

  def ad_params
    params.require(:ad).permit(:price,:year,:visit_count,:gears,:engine_size,:cylinders,:strokes,:paper_status,:color,:transmission_type,:description,:vehicle_id,:user_id,:title)
  end

end