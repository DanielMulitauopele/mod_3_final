require 'rails_helper'

describe 'as a guest user' do
  it "should return example sentences" do
    # As a guest user (no sign in required)
    # When I visit "/"
    visit '/'
    # And I fill in a text box with "mindfulness"
    fill_in 'search', with: "mindfulness"
    # And I click "Submit"
    click_on 'Submit'
    # Then I should see a message that says "Examples for using 'mindfulness'"
    expect(page).to have_content("Examples for using 'mindfulness'")
    # And I should see a list of sentences with examples of how to use the word
    expect(page).to have_css('.example-list')
    # And I should see only sentences where the region for usage is "Brittish" or "Canadian"
    expect(page).to have_css('.region', count: 2)
    expect(page).to have_content("Brittish")
    expect(page).to have_content("Canadian")
    # And I should not see sentences for any other regions (or blank regions)
  end
end
