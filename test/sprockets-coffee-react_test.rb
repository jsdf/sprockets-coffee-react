require 'test_helper'

class SprocketsCoffeeReactTest < ActionDispatch::IntegrationTest
  test "truth" do
    assert_kind_of Module, Sprockets::CoffeeReact
  end

  test "coffee preprocessed" do
    get "/assets/car.js.coffee"
    assert_equal File.open(example_file_path '/car.js').read, @response.body.to_s
    assert_response :success
  end

  test "coffee cjsx preprocessed" do
    get "/assets/car2.js.coffee.cjsx"
    assert_equal File.open(example_file_path '/car.js').read, @response.body.to_s
    assert_response :success
  end

  def example_dir
    File.dirname __FILE__
  end

  def example_file_path(filename)
    File.join example_dir, filename
  end
end
