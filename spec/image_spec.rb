require_relative "../lib/carousel_parser/image"
require 'nokogiri'


RSpec.describe "ImageExtractor" do
    let (:html) { File.read("./files/van-gogh-paintings.html")}
    let (:doc) { Nokogiri::HTML(html) }

    context "when nokogiri document is provided" do
        it "should return id to image mapping" do
            result = ImageExtractor.extract(doc)
            expect(result).to be_a(Hash)
            expect(result.first[0]).to eq("kximg0")
            expect(result.first[1]).to be_a(String).or(be_nil)
        end
    end
end