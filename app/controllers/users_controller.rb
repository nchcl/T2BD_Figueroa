class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'Usuario creado con exito.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Usuario actualizado con extio.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def respueston
    @user = User.find(params[:id])
    @section = Section.find(params[:section_id])
    @post = Post.find(params[:post_id])

    n_reply = Reply.where("user_id = ?", @user.id).count
    if n_reply < 5
      @user.update_attribute(:nivel_respueston, 'Bronce')
    elsif n_reply >= 5 and n_reply < 15
      @user.update_attribute(:nivel_respueston, 'Plata')
    elsif n_reply >= 15
      @user.update_attribute(:nivel_respueston, 'Oro')
    end

    redirect_to section_post_path(@section, @post)
  end

  def publicon
    @user = User.find(params[:id])
    @section = Section.find(params[:section_id])

    n_post = Post.where("user_id = ?", @user.id).count
    if n_post < 5
      @user.update_attribute(:nivel_publicon, 'Bronce')
    elsif n_post >= 5 and n_post < 15
       @user.update_attribute(:nivel_publicon, 'Plata')
    elsif n_post >= 15
       @user.update_attribute(:nivel_publicon, 'Oro')
    end
    redirect_to section_path(@section)
  end

  def delavatar
    @user = User.find(params[:id])
    @user.avatar.purge
    redirect_to @user
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'Usuario destruido con exito.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password, :password_confirmation, :birth_date, :avatar)
    end
end
