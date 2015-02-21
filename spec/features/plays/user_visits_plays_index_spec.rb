require 'rails_helper'


feature "a user visits plays index page", %q(
As a user
I want visit the plays page
So that I can see what plays listed

Acceptance Criteria
[x] I must be able to see the name of the play
) do
  scenario "user visits the plays index" do
    play = Play.create(title: "Bye Bye Birdie")

    visit plays_path

    expect(page).to have_content play.title
  end
end
