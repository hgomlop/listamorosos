require "application_system_test_case"

class MorososTest < ApplicationSystemTestCase
  setup do
    @moroso = morosos(:one)
  end

  test "visiting the index" do
    visit morosos_url
    assert_selector "h1", text: "Morosos"
  end

  test "should create moroso" do
    visit morosos_url
    click_on "New moroso"

    fill_in "Apellido", with: @moroso.apellido
    fill_in "Deuda", with: @moroso.deuda
    fill_in "Direccion", with: @moroso.direccion
    fill_in "Fecha", with: @moroso.fecha
    fill_in "Nombre", with: @moroso.nombre
    click_on "Create Moroso"

    assert_text "Moroso was successfully created"
    click_on "Back"
  end

  test "should update Moroso" do
    visit moroso_url(@moroso)
    click_on "Edit this moroso", match: :first

    fill_in "Apellido", with: @moroso.apellido
    fill_in "Deuda", with: @moroso.deuda
    fill_in "Direccion", with: @moroso.direccion
    fill_in "Fecha", with: @moroso.fecha
    fill_in "Nombre", with: @moroso.nombre
    click_on "Update Moroso"

    assert_text "Moroso was successfully updated"
    click_on "Back"
  end

  test "should destroy Moroso" do
    visit moroso_url(@moroso)
    click_on "Destroy this moroso", match: :first

    assert_text "Moroso was successfully destroyed"
  end
end
