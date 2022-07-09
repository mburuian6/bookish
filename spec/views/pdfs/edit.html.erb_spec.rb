require 'rails_helper'

RSpec.describe "pdfs/edit", type: :view do
  before(:each) do
    @pdf = assign(:pdf, Pdf.create!(
      title: "MyString",
      current_page: 1
    ))
  end

  it "renders the edit pdf form" do
    render

    assert_select "form[action=?][method=?]", pdf_path(@pdf), "post" do

      assert_select "input[name=?]", "pdf[title]"

      assert_select "input[name=?]", "pdf[current_page]"
    end
  end
end
