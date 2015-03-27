class UsersController < ApplicationController

  def show
    @user = User.find params[:id]

    @title = "#{@user.fullname} - Conseiller pour 10 conseils pour"
    @description = "#{@user.fullname}, conseiller pour 10 conseils pour est l'auteur de #{@user.advices_count} conseils et de #{@user.subjects_count} sujets."
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user.attributes = user_params
    if @user.save
      sign_up(:user, @user)
      redirect_to root_url, flash:{success: "Votre compte a bien été créé"}
    else
      render :new
    end
  end

  def update
    @user = User.find params[:id]
    @user.attributes = params[:user]
    if @user.save
      redirect_to me_path, flash:{success: "Votre profil a été mis à jour"}
    else
      render 'me/users/edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:firstname, :lastname, :email, :password, :password_confirmation, :birthdate, :website, :town)
    end


end
