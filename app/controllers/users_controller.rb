class UsersController < ApplicationController
  
  def show
  @user=User.find(params[:id])
  @books=@user.books
  @book=Book.new
  end

 def create

 end


def edit
  user_id = params[:id].to_i
  unless user_id == current_user.id
   redirect_to user_path(current_user)
  end
  @user=current_user
 end


 #def edit
  #@user=current_user
 #end
  
 def update
  user_id = params[:id].to_i
  unless user_id == current_user.id
   redirect_to books_path
  end
  @user=current_user
  if@user.update(user_params)
  flash[:notice] = "you have updated user successfully."
  redirect_to user_path(current_user)
  else  
  render :edit
  end
 end
 
  #def update
  #@user=current_user
  #if@user.update(user_params)
  #flash[:notice] = "you have updated user successfully."
  #redirect_to user_path(current_user)
  #else  
  #render :edit
  #end
 #end
 

  def index
  @books=Book.all
  @book=Book.new
  @users=User.all
  @user=current_user
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
end


