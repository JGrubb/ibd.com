class ImagesController < ApplicationController
  def destroy
    @image = Image.find(params[:id])
    @portfolio_item = PortfolioItem.find(@image.portfolio_item_id)
    @image.destroy
    redirect_to edit_portfolio_item_url(@portfolio_item)
  end
end
