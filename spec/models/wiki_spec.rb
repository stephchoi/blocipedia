require 'rails_helper'

RSpec.describe Wiki, type: :model do
    let(:user) { User.create!(email: "bloc@bloc.com", password: "password") }
    let(:wiki) { Wiki.create!(title: "Wiki Title", body: "This is the Wiki body. It should be long enough.", user: user) }
    
    it { is_expected.to belong_to(:user) }
    
    describe "attributes" do
       it "has title, and body attributes" do
           p user
           expect(wiki).to have_attributes(title: "Wiki Title", body: "This is the Wiki body. It should be long enough.")
       end
       
    end
end
