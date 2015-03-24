class UsersController < ApplicationController

  def show
    @user = User.find params[:id]
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


end
