require 'rails_helper'

RSpec.describe ChargesController, type: :controller do
    let(:my_user) { User.create!(email: "bloc@bloc.com", password: "password") }
    before do
       sign_in my_user 
    end
end
