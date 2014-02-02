require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PortfolioItemsController do

  # This should return the minimal set of attributes required to create a valid
  # PortfolioItem. As you add validations to PortfolioItem, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { title: "The Title", featured_image: "the featured image url" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PortfolioItemsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all portfolio_items as @portfolio_items" do
      portfolio_item = create :portfolio_item
      get :index, {} 
      assigns(:portfolio_items).should eq([portfolio_item])
    end
  end

  describe "GET show" do
    it "assigns the requested portfolio_item as @portfolio_item" do
      portfolio_item = create :portfolio_item
      get :show, {:id => portfolio_item.to_param} 
      assigns(:portfolio_item).should eq(portfolio_item)
    end
  end

  describe "GET new as unauthorized" do
    it "keeps the demons at bay" do
      get :new, {} 
      response.should redirect_to(new_user_session_path)
    end
  end

  describe "GET new" do
    login_user
    it "assigns a new portfolio_item as @portfolio_item" do
      get :new, {} 
      assigns(:portfolio_item).should be_a_new(PortfolioItem)
    end
  end

  describe "GET edit" do
    it "assigns the requested portfolio_item as @portfolio_item" do
      portfolio_item = create :portfolio_item
      get :edit, {:id => portfolio_item.to_param} 
      assigns(:portfolio_item).should eq(portfolio_item)
    end
  end

  describe "POST create" do
    login_user

    describe "with valid params" do
      it "creates a new PortfolioItem" do
        expect {
          post :create, {:portfolio_item => valid_attributes} 
        }.to change(PortfolioItem, :count).by(1)
      end

      it "assigns a newly created portfolio_item as @portfolio_item" do
        post :create, {:portfolio_item => valid_attributes} 
        assigns(:portfolio_item).should be_a(PortfolioItem)
        assigns(:portfolio_item).should be_persisted
      end

      it "redirects to the created portfolio_item" do
        post :create, {:portfolio_item => valid_attributes} 
        response.should redirect_to(PortfolioItem.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved portfolio_item as @portfolio_item" do
        # Trigger the behavior that occurs when invalid params are submitted
        PortfolioItem.any_instance.stub(:save).and_return(false)
        post :create, {:portfolio_item => { "title" => "invalid value" }} 
        assigns(:portfolio_item).should be_a_new(PortfolioItem)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        PortfolioItem.any_instance.stub(:save).and_return(false)
        post :create, {:portfolio_item => { "title" => "invalid value" }} 
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    login_user

    describe "with valid params" do
      it "updates the requested portfolio_item" do
        portfolio_item = create :portfolio_item
        # Assuming there are no other portfolio_items in the database, this
        # specifies that the PortfolioItem created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        PortfolioItem.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => portfolio_item.to_param, :portfolio_item => { "title" => "MyString" }} 
      end

      it "assigns the requested portfolio_item as @portfolio_item" do
        portfolio_item = create :portfolio_item
        put :update, {:id => portfolio_item.to_param, :portfolio_item => valid_attributes} 
        assigns(:portfolio_item).should eq(portfolio_item)
      end

      it "redirects to the portfolio_item" do
        portfolio_item = create :portfolio_item
        put :update, {:id => portfolio_item.to_param, :portfolio_item => valid_attributes} 
        response.should redirect_to(portfolio_item)
      end
    end

    describe "with invalid params" do
      it "assigns the portfolio_item as @portfolio_item" do
        portfolio_item = create :portfolio_item
        # Trigger the behavior that occurs when invalid params are submitted
        PortfolioItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => portfolio_item.to_param, :portfolio_item => { "title" => "invalid value" }} 
        assigns(:portfolio_item).should eq(portfolio_item)
      end

      it "re-renders the 'edit' template" do
        portfolio_item = create :portfolio_item
        # Trigger the behavior that occurs when invalid params are submitted
        PortfolioItem.any_instance.stub(:save).and_return(false)
        put :update, {:id => portfolio_item.to_param, :portfolio_item => { "title" => "invalid value" }} 
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    login_user

    it "destroys the requested portfolio_item" do
      portfolio_item = create :portfolio_item
      expect {
        delete :destroy, {:id => portfolio_item.to_param} 
      }.to change(PortfolioItem, :count).by(-1)
    end

    it "redirects to the portfolio_items list" do
      portfolio_item = create :portfolio_item
      delete :destroy, {:id => portfolio_item.to_param} 
      response.should redirect_to(portfolio_items_url)
    end
  end

end
