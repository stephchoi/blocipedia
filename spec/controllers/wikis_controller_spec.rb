require 'rails_helper'

RSpec.describe WikisController, type: :controller do
    let(:my_user) { User.create!(email: "bloc@bloc.com", password: "password") }
    let(:my_wiki) { Wiki.create!(title: "Wiki Title", body: "This is the Wiki body.", user: user) }
    
    describe "GET show" do
      it "returns http success" do
        get :show
        expect(response).to have_http_status(:success)
      end

      it "renders the #show view" do
        get :show
        expect(response).to render_template :show
      end

      it "assigns my_wiki to @wiki" do
        get :show
        expect(assigns(:wiki)).to eq(my_wiki)
      end
    end

    describe "GET new" do
      it "returns http success" do
        get :new
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new  
        expect(response).to render_template :new
      end

      it "instantiates @wiki" do
        get :new  
        expect(assigns(:wiki)).not_to be_nil
      end
    end

    # describe "POST create" do
    #   it "increases the number of Post by 1" do
    #     expect{ wiki :create, params: { topic_id: my_topic.id, wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } } }.to change(Post,:count).by(1)
    #   end

    #   it "assigns the new wiki to @wiki" do
    #     wiki :create, params: { topic_id: my_topic.id, wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
    #     expect(assigns(:wiki)).to eq Post.last
    #   end

    #   it "redirects to the new wiki" do
    #     wiki :create, params: { topic_id: my_topic.id, wiki: { title: RandomData.random_sentence, body: RandomData.random_paragraph } }
    #     expect(response).to redirect_to [my_topic, Post.last]
    #   end
    # end

    # describe "GET edit" do
    #   it "returns http success" do
    #     get :edit, params: { topic_id: my_topic.id, id: my_wiki.id }
    #     expect(response).to have_http_status(:success)
    #   end

    #   it "renders the #edit view" do
    #     get :edit, params: { topic_id: my_topic.id, id: my_wiki.id }
    #     expect(response).to render_template :edit
    #   end

    #   it "assigns wiki to be updated to @wiki" do
    #     get :edit, params: { topic_id: my_topic.id, id: my_wiki.id }
    #     wiki_instance = assigns(:wiki)

    #     expect(wiki_instance.id).to eq my_wiki.id
    #     expect(wiki_instance.title).to eq my_wiki.title
    #     expect(wiki_instance.body).to eq my_wiki.body
    #   end
    # end

    # describe "PUT update" do
    #   it "updates wiki with expected attributes" do
    #     new_title = RandomData.random_sentence
    #     new_body = RandomData.random_paragraph

    #     put :update, params: { topic_id: my_topic.id, id: my_wiki.id, wiki: { title: new_title, body: new_body } }

    #     updated_wiki = assigns(:wiki)
    #     expect(updated_wiki.id).to eq my_wiki.id
    #     expect(updated_wiki.title).to eq new_title
    #     expect(updated_wiki.body).to eq new_body
    #   end

    #   it "redirects to the updated wiki" do
    #     new_title = RandomData.random_sentence
    #     new_body = RandomData.random_paragraph

    #     put :update, params: { topic_id: my_topic.id, id: my_wiki.id, wiki: { title: new_title, body: new_body } }
    #     expect(response).to redirect_to [my_topic, my_wiki]
    #   end
    # end

    # describe "DELETE destroy" do
    #   it "deletes the wiki" do
    #     delete :destroy, params: { topic_id: my_topic.id, id: my_wiki.id }
    #     count = Post.where({id: my_wiki.id}).size
    #     expect(count).to eq 0
    #   end

    #   it "redirects to wikis index" do
    #     delete :destroy, params: { topic_id: my_topic.id, id: my_wiki.id }
    #     expect(response).to redirect_to my_topic
    #   end
    # end
end
