require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      :name => "MyString",
      :rating => 1,
      :domain => "MyString",
      :description => "MyText",
      :logo => "",
      :policy_url => "MyString"
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input#company_name[name=?]", "company[name]"

      assert_select "input#company_rating[name=?]", "company[rating]"

      assert_select "input#company_domain[name=?]", "company[domain]"

      assert_select "textarea#company_description[name=?]", "company[description]"

      assert_select "input#company_logo[name=?]", "company[logo]"

      assert_select "input#company_policy_url[name=?]", "company[policy_url]"
    end
  end
end
