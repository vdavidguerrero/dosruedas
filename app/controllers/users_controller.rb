class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @cities = City.all
    if request.content_type =~ /json/
      render json: @cities
    end

  end

  def create
    @seller = User.new(user_params)

    if @seller.save
      if request.content_type =~ /json/
        render json: {response:1}
      else
        redirect_to controller: "users", action: "show"
      end

    else
      if request.content_type =~ /json/
        render json: {response:2}
      else
        @cities = City.all
        flash[:name] = "Existe un error en el formulario"
        render 'new'
      end
    end
  end

  def view

  end


  private

  def user_params
    params.require(:user).permit(:name, :last_name, :email, :address, :password, :cellphone, :city_id, :phone)
  end

end



