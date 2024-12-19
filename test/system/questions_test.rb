require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit questions_url
  #
  #   assert_selector "h1", text: "Questions"
  # end
  test "visiting /ask renders the form" do
    visit ask_url
    assert_selector "p", text: "Ask your coach anything"
  end

  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "Ask"

    assert_text "I don't care, get dressed and go to work!"
  end

  test "saying Silly questions yields another grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "?"
    click_on "Ask"

    assert_text "Silly question, get dressed and go to work!"
  end

  test "saying I'm going to work yields a happy response from the coach" do
    visit ask_url
    fill_in "question", with: "I am going to work"
    take_screenshot
    click_on "Ask"

    assert_text "Great!"
  end
end
