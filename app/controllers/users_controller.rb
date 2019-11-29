class UsersController < ApplicationController
  before_action :admin?, except: [:show]
  before_action :user?, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @error
    @user = User.new(user_params)
    if @user.save
      session[:user_id]=@user.id
      redirect_to @user
    else
      @error = "Please check your email-id and password"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @user.salary_per_month = @user.salary_per_annum/12
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to @user
      else
        render 'edit'
      end
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to '/users'
  end


  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :fname, :lname, :age, :date_of_joining, :salary_per_annum, :salary_per_month, :phonenumber, :address, :blood_type, :emergency_name, :emergency_number, :primary_skill, :secondary_skill1, :secondary_skill2, :notice, :gender, :state, :pincode, :city, :country)
  end

  def admin?
    unless session[:user_type]=="admin"
      redirect_to root_path
    end
  end

  def user?
    if session[:user_type]==nil
     redirect_to root_path
   end
  end
end
