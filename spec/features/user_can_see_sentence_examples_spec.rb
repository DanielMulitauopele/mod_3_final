require 'rails_helper'

describe 'as a guest user' do
  it "should return example sentences" do
    visit '/'

    fill_in 'search', with: "mindfulness"
    click_on 'Submit'

    expect(page).to have_content("Examples for using 'mindfulness'")
    expect(page).to have_css('.example-list')
    expect(page).to have_css('.sentence-region', count: 3)
    
    expect(page).to have_content("British")
    expect(page).to have_content("Canadian")
    expect(page).to_not have_content("North American")
    expect(page).to_not have_content("unknown region")
  end
end
