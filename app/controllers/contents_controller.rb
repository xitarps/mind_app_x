class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_content, only: %i[show edit update destroy]

  def index
    @contents = Content.all
  end

  def new
    @content = Content.new
  end

  def create
    @content = current_user.contents.new(content_params)

    if @content.save && @content.update_tags(tags_params)
      redirect_to @content, notice: 'Saved successfully'
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @content.update(content_params) && @content.update_tags(tags_params)

      redirect_to @content, notice: 'Saved successfully' 

    else
      render :new
    end
  end

  def destroy

    return redirect_to contents_path, notice: 'Deleted successfully' if @content.destroy

    flash.now[:alert] = "Oops, something went wrong..."
    render :index
  end

  private

  def content_params
    params.require(:content).permit(:title, :description)
  end

  def tags_params
    params.require(:content).permit(tags: [])[:tags].reject(&:blank?)
  end

  def set_content
    @content = current_user.contents.find(params[:id])
  end
end
