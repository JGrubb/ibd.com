require 'spec_helper'

describe ImagesController do

  describe "DELETE destroy" do
    it "destroys the requested image" do
      image = Image.create! valid_attributes
      expect {
        delete :destroy, {:id => image.id} 
      }.to change(Image, :count).by(-1)
    end

    it "redirects to the polymorphic" do
      image = Image.create! valid_attributes
      delete :destroy, {:id => image.id} 
      response.should redirect_to(edit_ploymorphic_url)
    end
  end

end
