require 'spec_helper'

describe Content do
  let(:content) { Content.new("タイトル","http://example.com","説明")}

  describe "#display" do
    it "プロパティが参照できること" do
      expected = "Title: タイトル Link: http://example.com Description: 説明"
      expect(content.display).to eq expected
    end
  end

  describe "#format" do
    it "HTML形式でフォーマットされること" do
      expected = "<h3><a href='http://example.com'>タイトル</a></h3><p>説明</p>"
      expect(content.format).to eq expected
    end
  end
end