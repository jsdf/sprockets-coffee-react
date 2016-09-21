require 'test_helper'

class SprocketsCoffeeReactTest < ActionDispatch::IntegrationTest
  test "truth" do
    assert_kind_of Module, Sprockets::CoffeeReact
  end

  test ".js.coffee with pragma" do
    get "/assets/car1.js"
    assert_equal expected_output_file.read, @response.body.to_s
    assert_response :success
  end

  test ".js.coffee.cjsx without pragma" do
    get "/assets/car2.js"
    assert_equal expected_output_file.read, @response.body.to_s
    assert_response :success
  end

  test ".js.cjsx without pragma" do
    get "/assets/car3.js"
    assert_equal expected_output_file.read, @response.body.to_s
    assert_response :success
  end

  test ".js.cjsx with unicode" do
    get "/assets/car4.js"
    assert_equal expected_output_file.read, @response.body.to_s
    assert_response :success
  end

  test ".js" do
    get "/assets/car.js"
    assert_equal expected_output_file.read, @response.body.to_s
    assert_response :success
  end

  # for debugging
  def print_assert_equal(expected, actual)
    puts "expected ---\n#{expected}\n---"
    puts "actual ---\n#{actual}\n---"
    assert_equal expected, actual
  end

  def example_dir
    File.dirname __FILE__
  end

  def expected_output_file
    File.open(example_file_path '/dummy/app/assets/javascripts/car.js')
  end

  def example_file_path(filename)
    File.join example_dir, filename
  end
end
