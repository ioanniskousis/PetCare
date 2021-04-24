require 'rails_helper'

RSpec.describe 'PetCare Application', type: :system do
  describe 'home page' do
    it 'shows the right content' do
      visit root_path
      expect(page).to have_content('Pet Care')
    end
  end

end