class LinksController < ApplicationController
  def index
    @link = Link.new                    # Para o formulário
    @links = Link.order(created_at: :desc)  # Lista de links
  end
  
  def create
    @link = Link.new(link_params)
    
    if @link.save
      redirect_to root_path, notice: 'Link encurtado com sucesso!'
    else
      @links = Link.order(created_at: :desc)
      render :index, status: :unprocessable_entity
    end
  end
  
  def redirect
    @link = Link.find_by!(short_url: params[:short_url])
    redirect_to @link.original_url, allow_other_host: true
  end
  
  private
  
  def link_params
    params.require(:link).permit(:original_url)
  end
end