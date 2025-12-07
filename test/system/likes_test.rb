require "application_system_test_case"

class LikesTest < ApplicationSystemTestCase
  test "liking a photo immediately shows red heart without refresh" do
    # Login as test user
    visit "/login"
    fill_in "username", with: "testuser"
    fill_in "password", with: "password"
    click_button "Log in"

    # Navigate to home page with photos
    visit "/"

    # Find the heart icon for photo_one (should be outline/black)
    # Looking for the outline heart image
    outline_heart_url = "https://res.cloudinary.com/dckkkjkuz/image/upload/v1501188966/007-favorite_t5zsnu.png"
    red_heart_url = "https://res.cloudinary.com/dckkkjkuz/image/upload/v1501199362/011-hearts_c0p7ac.png"

    # Wait for page to load and verify outline heart is present
    assert_selector "img[src='#{outline_heart_url}']"

    # Find the specific heart button and click it
    heart_button = find("img[src='#{outline_heart_url}']", match: :first)
    heart_button.click

    # Immediately verify (without page refresh) that heart icon changed to red
    assert_selector "img[src='#{red_heart_url}']", wait: 5
  end

  test "unliking a photo immediately shows outline heart without refresh" do
    # Login as test user
    visit "/login"
    fill_in "username", with: "testuser"
    fill_in "password", with: "password"
    click_button "Log in"

    # Navigate to home page
    visit "/"

    # photo_two has an existing like from testuser (from fixtures)
    # So the red heart should already be visible
    red_heart_url = "https://res.cloudinary.com/dckkkjkuz/image/upload/v1501199362/011-hearts_c0p7ac.png"
    outline_heart_url = "https://res.cloudinary.com/dckkkjkuz/image/upload/v1501188966/007-favorite_t5zsnu.png"

    # Find and verify red heart is present
    assert_selector "img[src='#{red_heart_url}']"

    # Click the red heart to unlike
    heart_button = find("img[src='#{red_heart_url}']", match: :first)
    heart_button.click

    # Immediately verify (without page refresh) that heart icon changed back to outline
    assert_selector "img[src='#{outline_heart_url}']", wait: 5
  end

  test "liking and unliking a photo in sequence works correctly" do
    # Login as test user
    visit "/login"
    fill_in "username", with: "testuser"
    fill_in "password", with: "password"
    click_button "Log in"

    # Navigate to home page
    visit "/"

    outline_heart_url = "https://res.cloudinary.com/dckkkjkuz/image/upload/v1501188966/007-favorite_t5zsnu.png"
    red_heart_url = "https://res.cloudinary.com/dckkkjkuz/image/upload/v1501199362/011-hearts_c0p7ac.png"

    # Start with outline heart
    heart_button = find("img[src='#{outline_heart_url}']", match: :first)

    # Like the photo and assert that heart icon turns red
    heart_button.click
    assert_selector "img[src='#{red_heart_url}']", wait: 5

    # Unlike the photo (click the red heart that just appeared)
    # and assert that it turns back to outline hear icon
    red_heart_button = find("img[src='#{red_heart_url}']", match: :first)
    red_heart_button.click
    assert_selector "img[src='#{outline_heart_url}']", wait: 5

    # Like the photo and assert that heart icon turns red
    outline_heart_button = find("img[src='#{outline_heart_url}']", match: :first)
    outline_heart_button.click
    assert_selector "img[src='#{red_heart_url}']", wait: 5
  end
end
