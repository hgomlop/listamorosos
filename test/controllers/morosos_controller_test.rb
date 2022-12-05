require "test_helper"

class MorososControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moroso = morosos(:one)
  end

  test "should get index" do
    get morosos_url
    assert_response :success
  end

  test "should get new" do
    get new_moroso_url
    assert_response :success
  end

  test "should create moroso" do
    assert_difference("Moroso.count") do
      post morosos_url, params: { moroso: { apellido: @moroso.apellido, deuda: @moroso.deuda, direccion: @moroso.direccion, fecha: @moroso.fecha, nombre: @moroso.nombre } }
    end

    assert_redirected_to moroso_url(Moroso.last)
  end

  test "should show moroso" do
    get moroso_url(@moroso)
    assert_response :success
  end

  test "should get edit" do
    get edit_moroso_url(@moroso)
    assert_response :success
  end

  test "should update moroso" do
    patch moroso_url(@moroso), params: { moroso: { apellido: @moroso.apellido, deuda: @moroso.deuda, direccion: @moroso.direccion, fecha: @moroso.fecha, nombre: @moroso.nombre } }
    assert_redirected_to moroso_url(@moroso)
  end

  test "should destroy moroso" do
    assert_difference("Moroso.count", -1) do
      delete moroso_url(@moroso)
    end

    assert_redirected_to morosos_url
  end
end
