require 'spec_helper'

describe News do
  describe "#get_contents" do
    it "正しくフォーマットされた状態で取得できること" do
      contents = ["<h3><a href='link1'>title1</a></h3><p>exp1</p>","<h3><a href='link2'>title2</a></h3><p>exp2</p>"]
      rss_mock = double('NHK News')
      allow(rss_mock).to receive(:contents).and_return(contents)

      news = News.new(rss_mock)
      t = Time.parse("2016-11-11 金曜日 12:00")
      expected = "<h1>2016-11-11 金曜日 12:00</h1><h3><a href='link1'>title1</a></h3><p>exp1</p><h3><a href='link2'>title2</a></h3><p>exp2</p>"

      expect(news.get_contents(t)).to eq expected
    end
  end
end