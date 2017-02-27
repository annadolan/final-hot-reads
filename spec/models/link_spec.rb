require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'top_ten' do
    it "displays top ten links from past 24 hours in descending order" do
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

      links = Link.top_ten

      expect(links.first.read_count).to eq(56)
      expect(links.last.read_count).to eq(2)
      expect(links).to_not include(d.url)
    end
  end
end
