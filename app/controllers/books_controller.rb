class BooksController < ApplicationController


 def new
    # @book=Book.new
    # indexに記載をした
 end

 def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if@book.save
   flash[:notice] = "You have created book successfully."
   redirect_to book_path(@book.id)
   else @books=Book.all
        @user=current_user
   render 'users/show'
   end
 end


 def index
   @books=Book.all
   @book=Book.new
 end
  
 def show
   @book=Book.new
   @books=Book.all
   @Book=Book.find(params[:id])
   @user=@Book.user
 end
 
def edit
 @Book=Book.find(params[:id])
 user_id =@Book.user.id.to_i
 unless user_id == current_user.id
  redirect_to books_path
 end
end

 #def edit
  #@Book=Book.find(params[:id])
 #end


 def update
  @Book=Book.find(params[:id])
   user_id =@Book.user.id.to_i
   unless user_id == current_user.id
    redirect_to post_images_path
   end 
   @Book=Book.find(params[:id])
   if@Book.update(book_params)
   flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@Book.id) 
   else 
    render "edit"
   end
 end

 #def update
   #@Book=Book.find(params[:id])
   #if@Book.update(book_params)
   #flash[:notice] = "You have updated book successfully."
   #redirect_to book_path(@Book.id) 
   #else 
   #render "edit"
   #end
 #end

 
  def destroy
    @Book=Book.find(params[:id])
    @Book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to books_path
  end
  
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
  