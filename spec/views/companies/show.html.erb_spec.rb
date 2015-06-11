require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      :name => "Name",
      :rating => 1,
      :domain => "Domain",
      :description => "MyText",
      :logo => "",
      :policy_url => "Policy Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Domain/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Policy Url/)
  end
end
