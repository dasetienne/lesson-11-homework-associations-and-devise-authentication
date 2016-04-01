class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show 
    @tag = Tag.find(params[:id])
  end

  def new 
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash[:notice] = "Tag has been added!"
      redirect_to tag_path(@tag)
    else
      flash.now[:error] = "Something went wrong, please try again!"
      render :new
    end
  end

  def edit 
    @tag = Tag.find(params[:id])
  end

  def update
    @tag = Tag.find(params[:id])

    if @tag.update(tag_params)
      redirect_to tag_path(@tag), notice: "Tag was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this tag"
      render :edit
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    redirect_to tags_path, notice: "Tag was successfully deleted"
  end

  private

  def tag_params
   params.require(:tag).permit(:name)

end

end
