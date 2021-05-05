# require "test_helper"

# class HeaderComponentTest < ViewComponent::TestCase
#   def test_component_renders_something_useful
#     assert_match(
#       "Dashboard",
#       render_inline(HeaderComponent.new(title: "Dashboard")).to_html
#     )
#   end
# end


require "rails_helper"

RSpec.describe HeaderComponent, type: :component do
  it "renders component" do
    render_inline(described_class.new(title: "my title")) { "Hello, World!" }

    expect(rendered_component).to have_css "span[title='my title']", text: "Hello, World!"
    # or, to just assert against the text
    expect(rendered_component).to have_text "Hello, World!"
  end
end