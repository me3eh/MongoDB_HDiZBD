require "application_system_test_case"

class TitlesTest < ApplicationSystemTestCase
  setup do
    @title = titles(:one)
  end

  test "visiting the index" do
    visit titles_url
    assert_selector "h1", text: "Titles"
  end

  test "should create title" do
    visit titles_url
    click_on "New title"

    fill_in "Endyear", with: @title.endYear
    fill_in "Genres", with: @title.genres
    fill_in "Isadult", with: @title.isAdult
    fill_in "Originaltitle", with: @title.originalTitle
    fill_in "Primarytitle", with: @title.primaryTitle
    fill_in "Runtimeminutes", with: @title.runtimeMinutes
    fill_in "Startyear", with: @title.startYear
    fill_in "Tconst", with: @title.tconst
    fill_in "Titletype", with: @title.titleType
    click_on "Create Title"

    assert_text "Title was successfully created"
    click_on "Back"
  end

  test "should update Title" do
    visit title_url(@title)
    click_on "Edit this title", match: :first

    fill_in "Endyear", with: @title.endYear
    fill_in "Genres", with: @title.genres
    fill_in "Isadult", with: @title.isAdult
    fill_in "Originaltitle", with: @title.originalTitle
    fill_in "Primarytitle", with: @title.primaryTitle
    fill_in "Runtimeminutes", with: @title.runtimeMinutes
    fill_in "Startyear", with: @title.startYear
    fill_in "Tconst", with: @title.tconst
    fill_in "Titletype", with: @title.titleType
    click_on "Update Title"

    assert_text "Title was successfully updated"
    click_on "Back"
  end

  test "should destroy Title" do
    visit title_url(@title)
    click_on "Destroy this title", match: :first

    assert_text "Title was successfully destroyed"
  end
end
