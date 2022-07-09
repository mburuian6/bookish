require 'rails_helper'

RSpec.describe "pdfs/new", type: :view do
  before(:each) do
    assign(:pdf, Pdf.new(
      title: "MyString",
      current_page: 1
    ))
  end

  it "renders new pdf form" do
    render

    assert_select "form[action=?][method=?]", pdfs_path, "post" do

      assert_select "input[name=?]", "pdf[title]"

      assert_select "input[name=?]", "pdf[current_page]"
    end
  end
end
