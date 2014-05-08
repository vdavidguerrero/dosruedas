class UsersController < ApplicationController
  protect_from_forgery except: :create

  # entrega las ciudades necesarias para crear un usuario.
  def new
    @cities = City.all
    respond_to do |format|
      format.html
      format.json{ render json: @cities.as_json(only:[:id, :name ]) }
    end
  end

  #crea un usuario nueva en la base de datos.
  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      respond_to do |format|
        format.html{ redirect_to controller: "users", action: "show"}
        format.json{ render json: {response:1} }
      end

    else
      @cities = City.all
      respond_to do |format|
        format.html{ render 'new' }
        format.json{ render json: {response:2} }
      end
    end
  end

  # Entrega los datos del usuario logeado
  def show
    @user = User.find(session[:user_id])
    respond_to do |format|
      format.html
      format.json { render json: @user.as_json(only: [:id, :name, :last_name, :email, :address, :password, :cellphone,:phone], include: [city: {only:[:id, :name ]}])}
    end
  end



  private

  def user_params
    params.require(:user).permit(:name, :last_name, :email, :address, :password, :cellphone, :city_id, :phone, :password_confirmation)
  end

end



