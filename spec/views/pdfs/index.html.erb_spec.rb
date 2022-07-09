require 'rails_helper'

RSpec.describe "pdfs/index", type: :view do
  before(:each) do
    assign(:pdfs, [
      Pdf.create!(
        title: "Title",
        current_page: 2
      ),
      Pdf.create!(
        title: "Title",
        current_page: 2
      )
    ])
  end

  it "renders a list of pdfs" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
