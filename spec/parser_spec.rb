require_relative '../lib/parser'


RSpec.describe "Test Parser" do
  let(:html) { File.read("./files/van-gogh-paintings.html") }
  let(:doc) { Nokogiri::HTML(html) }

  describe "parser" do
    it "returns expected-array" do
      result = parser(html)
      expect(result).to be_a(Hash)
      expect(result[:artworks]).to be_an(Array)
      expect(result[:artworks].size).to eq(51)
    end
  end

  describe "parse_artworks" do
    it "returns array of artworks" do
      parsed_artworks = parse_artworks(doc)
      expect(parsed_artworks).to be_an(Array)
      expect(parsed_artworks.size).to eq(51)
      expect(parsed_artworks.first).to be_a(Hash)
      expect(parsed_artworks.first.keys).to eq([:name, :extensions, :link, :image])
      expect(parsed_artworks.first[:name]).not_to be_nil
    end
  end

  describe "extract" do
    it "returns an artwork info from a carousel" do
      painting = doc.css('g-scrolling-carousel.wqBQjd > div > div > div').first
      result = extract(painting, doc)
      expect(result[:name]).to eq('The Starry Night')
      expect(result[:extensions]).to eq(["1889"])
      expect(result[:link]).to eq("https://www.google.com/search?gl=us&hl=en&q=The+Starry+Night&stick=H4sIAAAAAAAAAONgFuLQz9U3MI_PNVLiBLFMzC3jC7WUspOt9Msyi0sTc-ITi0qQmJnFJVbl-UXZxY8YI7kFXv64JywVMGnNyWuMXlxEaBJS4WJzzSvJLKkUkuLikYLbrcEgxcUF5_EsYhUIyUhVCC5JLCqqVPDLTM8oAQDmNFnDqgAAAA&npsic=0&sa=X&ved=0ahUKEwiL2_Hon4_hAhXNZt4KHTOAACwQ-BYILw")
    end
  end

  describe "get_images" do
    it "returns id to image mapping" do
      expect(get_images(doc)).to be_a(Hash)
      expect(get_images(doc)).not_to be_empty
    end
  end
end
