class UsersController < ApplicationController

  before_action :confirm_logged_in, except: [:new, :create, :authenticate, :login, :index, :logout]

  # Nuevo Usuairo...
  # Despliega un formulario para crear un usuario nuevo
  def new
    @cities = City.all

  end

  # Crea un usuario...
  # Recibe los datos del usuario, la valida y crea
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to controller: "users", action: "show"

    else
      @cities = City.all
      render 'new'
    end
  end

  # Entrega los datos del usuario logeado
  # Muestra el usuario que esta en sesion al momento
  def show
    @user = User.find(session[:user_id])
  end

  # Carga el inicio de sesion
  # Muestra el formulario para iniciar sesion
  def login

  end

  # Autentifica el usuario en la base de datos
  # Revisa el usaurio y la contraseña
  def authenticate
    if params[:email].present? && params[:email].present?
      @user = User.find_by_email(params[:email])
      if !@user.nil?
        @user = @user.authenticate(params[:password])
      end
    end

    if @user
      session[:user_id] = @user.id
      redirect_to controller: 'users', action: 'index'
    else
      flash[:message] = "Usuario/Contraseña Incorrecto"
      render 'login'
    end
  end

  #Saca de sesion
  #toma al usuario actual y lo saca de sesion
  def logout
    session[:user_id] = nil
    redirect_to controller: 'users', action: 'index'
  end

  #Saca de sesion
  #toma al usuario actual y lo saca de sesion
  def index

  end

  #Edicion de usuario
  #Carga la vista para editar un suario
  def edit
    @cities = City.all
    @user = User.find(session[:user_id])
  end

  #edita un usuario
  #recibe los datos de un usuario y los validas.
  def update
    @cities = City.all
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(user_params)
      redirect_to controller: "users", action: "show"
    else
      render 'edit'
    end
  end

  #Borrar usuario
  #Borra el usuario que está en sessión
  def delete
    User.find(session[:user_id]).destroy
    session[:user_id] = nil
    redirect_to controller: "users", action: "index"

  end


  private
    def user_params
      params.require(:user).permit(:name, :last_name, :email, :address, :password, :password_confirmation, :cellphone, :city_id, :phone)
    end

end



