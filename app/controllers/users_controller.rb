class UsersController < ApplicationController

def show
  @user = User.find(params[:id])
end

def edit
  @user = User.find(params[:id])
end

def update
  user = User.find(params[:id])
  if user.id == current_user.id
    user.update(user_params)
  end
  redirect_to controller: :users, action: :show


end

    private
    def user_params
      params.permit(:name, :nickname, :profession, :sex, :birth_day, :office_name)
    end

end
