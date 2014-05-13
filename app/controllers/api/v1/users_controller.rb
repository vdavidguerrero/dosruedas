class API::V1::UsersController < ApplicationController
  respond_to :json
  before_action :authenticate, except: [:cities, :login, :create]

  # return a JSON with all the dominican republic cities
  def cities
    respond_with City.all.as_json(only:[:id, :name])
  end

  # return the user data from an specific ID
  def get
    @user = User.find(params[:id])
    respond_with @user.as_json(only: [:id, :name, :last_name, :email, :address, :password, :cellphone,:phone], include: [city: {only:[:id, :name ]}])
  end

  # Creates an user on the data base
  def create
    new_parms = user_params
    new_parms[:password] = params[:password]
    new_parms[:password_confirmation] = params[:password_confirmation]
    respond_with User.create(new_parms).auth_token
  end

  # Updates the session user
  def update
    new_parms = user_params
    new_parms[:password] = params[:password]
    new_parms[:password_confirmation] = params[:password_confirmation]
    @user = User.find_by_email(new_parms[:email])
    if @user.update_attributes(new_parms)
      respond_with @user
    else
      respond_with 1
    end
  end

  #checks the username and password and return the unique token
  def login
    @user = User.find_by_email(params[:email])
    if @user.authenticate(params[:password])
      respond_with @user.auth_token
    else
      respond_with 1
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :last_name, :email, :address, :password, :password_confirmation, :cellphone, :city_id, :phone)
  end



end
