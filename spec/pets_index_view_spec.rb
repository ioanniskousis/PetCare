require 'rails_helper'

RSpec.describe 'PetCare Application', type: :system do
  before(:each) do
    User.delete_all
    user = User.create!(:email => 'test1@example.com', :password => 'f4k3p455w0rd', :firstname => 'Test', :surname => 'User')
    login_as(user, :scope => :user)

    pet = Pet.create!(:name => "Jack", :owner => user)

  end

  describe 'pets index' do
    it 'shows the number of pets of current user' do
      visit pets_path(owner: User.first.id)
      # sleep(10)
      expect(page).to have_content('Test User: 1 Pet')
    end

    it 'shows the name of newlly inserted pet' do
      visit pets_path(owner: User.first.id)
      # sleep(10)
      expect(page).to have_content('Jack')
    end

    it 'shows Not Sterilised Status of newlly inserted pet' do
      visit pets_path(owner: User.first.id)
      # sleep(10)
      expect(page).to have_content('Not Sterilised')
    end
  end
end