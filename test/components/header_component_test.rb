require "test_helper"

class HeaderComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    assert_equal(
      %(<h1>Dashboard</h1>),
      render_inline(HeaderComponent.new(title: "Dashboard")).css("h1").to_html
    )
  end
end
