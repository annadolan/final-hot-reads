require 'rails_helper'

describe "POST /api/v1/links" do
  it "creates link or updates read count on existing link", :vcr do
    headers = {'CONTENT-TYPE' => 'application/json'}
    post "/api/v1/links", headers: headers, params: { link: { url: "http://www.turing.io" } }.to_json

    expect(response).to be_success
    link = JSON.parse(response.body)
    expect(link["read_count"]).to eq(1)

  end
end
