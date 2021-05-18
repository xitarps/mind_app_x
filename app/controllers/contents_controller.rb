class ContentsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_content, only: %i[show edit update destroy]

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

  def show; end

  def edit; end

  def update

    return redirect_to @content, notice: 'Saved successfully' if @content.update(content_params)

    render :new
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

  def fetch_content
    @content = current_user.contents.find(params[:id])
  end
end
