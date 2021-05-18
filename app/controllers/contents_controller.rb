class ContentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    @content = current_user.contents.new(content_params)

    return redirect_to @content, notice: 'Saved successfully' if @content.save

    render :new
  end

  def show
    @content = current_user.contents.find(params[:id])
  end

  def edit
    @content = current_user.contents.find(params[:id])
  end

  def update
    @content = current_user.contents.find(params[:id])

    return redirect_to @content, notice: 'Saved successfully' if @content.update(content_params)

    render :new
  end

  def destroy
    @content = current_user.contents.find(params[:id])

    return redirect_to contents_path, notice: 'Deleted successfully' if @content.destroy

    flash.now[:alert] = "Oops, something went wrong..."
    render :index
  end

  private

  def content_params
    params.require(:content).permit(:title, :description)
  end
end
