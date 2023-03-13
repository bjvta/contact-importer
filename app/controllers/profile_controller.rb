# frozen_string_literal: true

class ProfileController < ApplicationController
  def show; end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if user.update(profile_params)
      redirect_to profile_show_path, notice: 'Profile was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def profile_params
    params.require(:user).permit(:email)
  end
end
