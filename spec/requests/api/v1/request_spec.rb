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

describe "GET /api/v1/links" do
  it "returns top ten links" do
    a = Link.create(url: "http://www.a.com", read_count: 2)
    b = Link.create(url: "http://www.b.com", read_count: 5)
    c = Link.create(url: "http://www.c.com", read_count: 1)
    d = Link.create(url: "http://www.d.com", read_count: 6, updated_at: "Sun, 12 Feb 2017 02:54:47 UTC +00:00")
    e = Link.create(url: "http://www.e.com", read_count: 3)
    f = Link.create(url: "http://www.f.com", read_count: 9)
    g = Link.create(url: "http://www.g.com", read_count: 21)
    h = Link.create(url: "http://www.h.com", read_count: 4)
    i = Link.create(url: "http://www.i.com", read_count: 32)
    j = Link.create(url: "http://www.j.com", read_count: 56)
    k = Link.create(url: "http://www.k.com", read_count: 7)
    l = Link.create(url: "http://www.l.com", read_count: 8)

    get "/api/v1/links"

    expect(response).to be_success
    links = JSON.parse(response.body)
    expect(links.count).to eq(10)
    expect(links.first).to be_a(Hash)
    expect(links.first["url"]).to eq(j.url)
  end
end
