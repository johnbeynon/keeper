require "test_helper"

class HeaderComponentTest < ViewComponent::TestCase
  def test_component_renders_something_useful
    assert_match(
      "Dashboard",
      render_inline(HeaderComponent.new(title: "Dashboard")).to_html
    )
  end
end
