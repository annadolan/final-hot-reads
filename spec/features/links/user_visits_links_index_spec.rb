require 'rails_helper'

describe "A visitor visits the links index page" do
  it "And sees the top ten links in descending order" do
    a = Link.create(url: "http://www.a.com", read_count: 2)
    b = Link.create(url: "http://www.b.com", read_count: 5)
    c = Link.create(url: "http://www.c.com", read_count: 1)
    d = Link.create(url: "http://www.d.com", read_count: 6)
    e = Link.create(url: "http://www.e.com", read_count: 3)
    f = Link.create(url: "http://www.f.com", read_count: 9)
    g = Link.create(url: "http://www.g.com", read_count: 21)
    h = Link.create(url: "http://www.h.com", read_count: 4)
    i = Link.create(url: "http://www.i.com", read_count: 32)
    j = Link.create(url: "http://www.j.com", read_count: 56)
    k = Link.create(url: "http://www.k.com", read_count: 7)
    l = Link.create(url: "http://www.l.com", read_count: 8)

    visit root_path

    expect(page).to have_content("http://www.j.com: Read 56 times http://www.i.com: Read 32 times http://www.g.com: Read 21 times http://www.f.com: Read 9 times http://www.l.com: Read 8 times http://www.k.com: Read 7 times http://www.d.com: Read 6 times http://www.b.com: Read 5 times http://www.h.com: Read 4 times http://www.e.com: Read 3 times")
  end
end
