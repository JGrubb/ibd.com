class ImagesController < ApplicationController
  def destroy
    @image = Image.find(params[:id])
    @item = @image.imageable_type.constantize.find(@image.imageable_id)
    @image.destroy
    redirect_to edit_polymorphic_path(@item)
  end
end
