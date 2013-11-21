class PagesController < ApplicationController
  before_action :set_page, only: [:versions, :edit, :update]
  before_action :prepare_form, only: [:new, :edit]

  def index
    @pages = Page.all.order(:slug)
  end

  def show
    @page = Page.where(slug: params[:id]).first_or_initialize(title: params[:id])
    @body = MarkdownParser.new(@page.body).to_html if @page.persisted?
    flash.now[:error] = 'This page does not exist yet.' if @page.new_record?
  end

  def preview
    html_body = MarkdownParser.new(params[:markdown]).to_html
    render json: { html_body: html_body }
  end

  def versions
    @versions = VersionService.new(@page).versions.reverse
  end

  def new
    title = params[:path].split('/').last.titleize if params[:path]
    @page = Page.new title: title, slug: params[:path]
  end

  def edit
  end

  def create
    params[:page].delete(:slug) if params[:page][:slug].empty?
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

  def prepare_form
    @markdown_reference_list = MarkdownReference.all
  end

  def set_page
    @page = Page.friendly.find params[:id]
  end

  def page_params
    params.require(:page).permit(:title, :body, :slug).merge(updated_by: current_user)
  end
end
