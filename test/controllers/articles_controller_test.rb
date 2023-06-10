require 'test_helper'
class ArticlesControllerTest < ActionController::TestCase
  def setup
    @article = articles(:one) # Asumiendo que tienes un artículo existente en tu base de datos de pruebas
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:articles)
  end

  test "should show article" do
    get :show, params: { id: @article.id }
    assert_response :success
    assert_not_nil assigns(:article)
  end

  test "should redirect to login when creating article without authentication" do
    post :create, params: { article: { title: "Test", content: "Lorem ipsum" } }
    assert_redirected_to login_path
  end

  test "should redirect to root when non-admin user tries to create article" do
    sign_in users(:non_admin_user) # Asumiendo que tienes un usuario no administrador en tus datos de prueba
    post :create, params: { article: { title: "Test", content: "Lorem ipsum" } }
    assert_redirected_to root_path
  end

  # More tests for other controller actions...

end
