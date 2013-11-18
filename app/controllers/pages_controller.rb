class PagesController < ApplicationController
  before_action :set_page, only: [:edit, :update]

  def index
    @pages = Page.all
  end

  def show
    @page = Page.where(slug: params[:id]).first_or_initialize(title: params[:id])
  end

  def new
    @page = Page.new(title: params[:title])
  end

  def edit
  end

  def create
    @page = Page.new page_params

    if @page.save
      redirect_to @page, notice: 'Page was successfully created.'
    else
      flash.now[:error] = @page.errors.full_messages.join(', ')
      render :new
    end
  end

  def update
    if @page.update page_params
      redirect_to @page, notice: 'Page was successfully updated.'
    else
      flash[:error] = @page.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def set_page
    @page = Page.friendly.find params[:id]
  end

  def page_params
    params.require(:page).permit(:title, :body, :slug)
  end
end
