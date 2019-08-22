require "application_system_test_case"

class DeclensionsTest < ApplicationSystemTestCase
  setup do
    @declension = declensions(:one)
  end

  test "visiting the index" do
    visit declensions_url
    assert_selector "h1", text: "Declensions"
  end

  test "creating a Declension" do
    visit declensions_url
    click_on "New Declension"

    fill_in "Dative", with: @declension.dative
    click_on "Create Declension"

    assert_text "Declension was successfully created"
    click_on "Back"
  end

  test "updating a Declension" do
    visit declensions_url
    click_on "Edit", match: :first

    fill_in "Dative", with: @declension.dative
    click_on "Update Declension"

    assert_text "Declension was successfully updated"
    click_on "Back"
  end

  test "destroying a Declension" do
    visit declensions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Declension was successfully destroyed"
  end
end
