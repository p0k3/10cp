class UsersController < ApplicationController

  def show
    @user = User.find params[:id]

    @title = "#{@user.fullname} - Conseiller pour 10 conseils pour"
    @description = "#{@user.fullname}, conseiller pour 10 conseils pour est l'auteur de #{@user.advices_count} conseils et de #{@user.subjects_count} sujets."
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
