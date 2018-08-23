require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "creating a Student" do
    visit students_url
    click_on "New Student"

    fill_in "Branch", with: @student.branch_id
    fill_in "Student Address", with: @student.student_address
    fill_in "Student Name", with: @student.student_name
    fill_in "Student Sem", with: @student.student_sem
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "updating a Student" do
    visit students_url
    click_on "Edit", match: :first

    fill_in "Branch", with: @student.branch_id
    fill_in "Student Address", with: @student.student_address
    fill_in "Student Name", with: @student.student_name
    fill_in "Student Sem", with: @student.student_sem
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "destroying a Student" do
    visit students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student was successfully destroyed"
  end
end
