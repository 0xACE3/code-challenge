require_relative '../lib/carousel_parser/carousel'
require_relative '../lib/carousel_parser/image'
require 'nokogiri'


RSpec.describe "CarouselExtractor" do

    let (:html) { File.read("./files/van-gogh-paintings.html")}
    let (:doc) { Nokogiri::HTML(html) }

    context "when content is provided" do
        it "should return a carousel hash" do
            carousels = doc.css("g-scrolling-carousel > div > div > div")
            random_indexes = (0...carousels.length - 1).to_a.sample(10)
            images = ImageExtractor.extract(doc)
            
            for i in random_indexes do
                result = CarouselExtractor.extract(carousels[i], images)

                expect(result).to be_a(Hash)
                expect(result[:name]).to be_a(String)
                expect(result[:extensions]).to be_a(Array)
                expect(result[:link]).to be_a(String)
                expect(result[:image]).to be_a(String).or(be_nil)
        
            end

        end
    end
end




