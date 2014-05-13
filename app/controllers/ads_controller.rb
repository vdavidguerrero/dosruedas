class AdsController < ApplicationController

  before_action :confirm_logged_in
  def index
    @ads = Ad.all
  end

  def create
    @ad = Ad.new(ad_params)
    if @ad.save
      redirect_to controller: "ads", action: "show"

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
    @ad = Ad.find(3)

  end


  private
  def ad_params
    params.require(:ad).permit(:price,:year,:visit_count,:gears,:engine_size,:cylinders,:strokes,:paper_status,:color,:transmission_type,:description,:vehicle_id,:user_id,:title)
  end

end
