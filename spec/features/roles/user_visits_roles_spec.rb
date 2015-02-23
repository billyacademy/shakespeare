require 'rails_helper'


feature "a user visits a play's roles page", %q(
As a user
I want visit the roles page for a play
So that I see statistics based on the different roles

Acceptance Criteria
[x] I must be able to see the name of the play
) do
  scenario "user visits a play's roles page" do
    play1 = FactoryGirl.create(:play)

    visit play_roles_path(play1.id)

    expect(page).to have_content play1.title
  end
end
