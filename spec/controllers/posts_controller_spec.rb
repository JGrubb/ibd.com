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

describe PostsController do

  # This should return the minimal set of attributes required to create a valid
  # Post. As you add validations to Post, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "title" => "My Title" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PostsController. Be sure to keep this updated too.
  let(:valid_session) { { } }

  describe "GET archive" do
    it "assigns all the posts as @posts_by_year" do
      post = create :post
      get :archive
      post_blob = {
        "2014" => [post],
        "2013" => [],
        "2012" => [],
        "2011" => [],
        "2010" => [],
        "2009" => []
      }
      assigns(:posts_by_year).should eq post_blob
    end

    it "renders the archive template" do
      get :archive
      response.should render_template :archive
    end
  end

  describe "GET show" do
    it "assigns the requested post as @post" do
      post = create(:post)
      get :show, {year: post.year, month: post.month, :id => post.id} 
      assigns(:post).should eq(post)
    end
  end

  describe "GET new as unauthorized" do
    it "prevents unauthorized posting" do
      get :new, {}
      response.should redirect_to(new_user_session_path)
    end
  end

  describe "GET new as authorized" do 
    login_user
    it "assigns a new post as @post" do
      get :new, {}
      assigns(:post).should be_a_new(Post)
    end
  end

  describe "GET edit" do
    it "assigns the requested post as @post" do
      post = create :post
      get :edit, {:id => post.slug}
      assigns(:post).should eq(post)
    end
  end

  describe "POST create" do
    login_user

    describe "with valid params" do
      it "creates a new Post" do
        expect {
          create :post
        }.to change(Post, :count).by(1)
      end

      it "assigns a newly created post as @post" do
        post :create, {:post => valid_attributes}
        assigns(:post).should be_a(Post)
        assigns(:post).should be_persisted
      end

      it "redirects to the created post" do
        post :create, {:post => valid_attributes} 
        response.should redirect_to(post_date_path(
                                      Post.last.year, 
                                      Post.last.month,
                                      Post.last.slug))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved post as @post" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => { "title" => "invalid value" }} 
        assigns(:post).should be_a_new(Post)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        post :create, {:post => { "title" => "invalid value" }} 
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      login_user

      it "updates the requested post" do
        post = create :post
        # Assuming there are no other posts in the database, this
        # specifies that the Post created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Post.any_instance.should_receive(:update).with({ "title" => "MyString" })
        put :update, {:id => post.id, :post => { "title" => "MyString" }} 
      end

      it "assigns the requested post as @post" do
        post = create :post
        put :update, {:id => post.id, :post => valid_attributes} 
        assigns(:post).should eq(post)
      end

      it "redirects to the post" do
        post = create :post
        put :update, {:id => post.id, :post => valid_attributes} 
        response.should redirect_to(post_date_path(post.year, post.month, post.slug))
      end
    end

    describe "with invalid params" do
      login_user

      it "assigns the post as @post" do
        post = create :post
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => post.id, :post => { "title" => "invalid value" }} 
        assigns(:post).should eq(post)
      end

      it "re-renders the 'edit' template" do
        post = create :post
        # Trigger the behavior that occurs when invalid params are submitted
        Post.any_instance.stub(:save).and_return(false)
        put :update, {:id => post.id, :post => { "title" => "invalid value" }} 
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested post" do
      post = create :post
      expect {
        delete :destroy, {:id => post.id} 
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = create :post
      delete :destroy, {:id => post.id} 
      response.should redirect_to(post_index_url)
    end
  end

end
