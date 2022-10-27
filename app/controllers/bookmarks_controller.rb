class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    bookmark_params[:movie].each do |movie|
      @bookmark = Bookmark.new({ comment: bookmark_params[:comment], movie_id: movie })
      @bookmark.list = @list
      @bookmark.save
      render 'lists/show', status: :unprocessable_entity
      # the below code is for when we use the new.html.erb of bookmarks
      # render :new, status: :unprocessable_entity
    end
    redirect_to list_path(@list)
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, movie: [])
  end
end
