require 'rails_helper'
feature 'Museum\'s Reviews Create' do
  let!(:museum) { FactoryGirl.create(:museum) }
  let!(:review) { FactoryGirl.create(:review, museum: museum) }

  scenario 'User creates a review' do
    visit museum_path(museum)
    fill_in 'Rating', with: 5
    fill_in 'Body', with: 'Awesome Museum!!!...JK'

    click_button 'Create Review'

    expect(page).to have_content(review.rating)
    expect(page).to have_content(review.body)
  end
  scenario 'User tries tp create a review with empty fields' do
    visit museum_path(museum)
    fill_in 'Rating', with: ''
    fill_in 'Body', with: ''

    click_button 'Create Review'

    expect(page).to have_content('Rating can\'t be blank')
    expect(page).to have_content('Rating is not a number')
    expect(page).to have_content('Rating is not a valid numeric rating (Must be between 1-5)')
  end

end
