require 'spec_helper'

describe News do
  describe "#get_contents" do
    it "正しくフォーマットされた状態で取得できること" do
      contents = ["<h3><a href='link1'>title1</a></h3><p>exp1</p>","<h3><a href='link2'>title2</a></h3><p>exp2</p>"]
      rss_mock = double('NHK News')
      allow(rss_mock).to receive(:contents).and_return(contents)

      logger_mock = double('logger')
      allow(logger_mock).to receive(:error)

      news = News.new(rss_mock,logger_mock)
      t = Time.parse("2016-11-11 金曜日 12:00")
      expected = "<h1>2016-11-11 金曜日 12:00</h1><h3><a href='link1'>title1</a></h3><p>exp1</p><h3><a href='link2'>title2</a></h3><p>exp2</p>"

      expect(news.get_contents(t)).to eq expected
    end

    context "エラー時" do
      it "ログが出力されること" do
        rss_mock = double('NHK News')
        allow(rss_mock).to receive(:contents).and_raise(RSSLoadError)

        logger_mock = double('logger')
        allow(logger_mock).to receive(:error)

        news = News.new(rss_mock,logger_mock)
        
        expect(logger_mock).to receive(:error)
        expect{news.get_contents(nil)}.to raise_error(RSSLoadError)
      end
    end
  end
end