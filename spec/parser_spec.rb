require_relative "../lib/carousel_parser/parser"


RSpec.describe "Parser" do

    let (:html) { File.read("./files/van-gogh-paintings.html")}

    context "when content is provided" do

        it "should return carousel's results" do

            results = CarouselParser.parse(html)

            expect(results).to be_a(Hash)
            expect(results[:artworks]).to be_a(Array)
            expect(results[:artworks].length).to eq(51)
            expect(results[:artworks][0]).to be_a(Hash)
            expect(results[:artworks][0][:name]).to be_a(String)
            expect(results[:artworks][0][:extensions]).to be_a(Array)
            expect(results[:artworks][0][:link]).to be_a(String)
            expect(results[:artworks][0][:image]).to be_a(String).or(be_nil)

            expect(results[:artworks][0][:name]).to eq("The Starry Night")
            expect(results[:artworks][0][:extensions]).to eq(["1889"])
            expect(results[:artworks][0][:link]).to eq("https://www.google.com/search?gl=us&hl=en&q=The+Starry+Night&stick=H4sIAAAAAAAAAONgFuLQz9U3MI_PNVLiBLFMzC3jC7WUspOt9Msyi0sTc-ITi0qQmJnFJVbl-UXZxY8YI7kFXv64JywVMGnNyWuMXlxEaBJS4WJzzSvJLKkUkuLikYLbrcEgxcUF5_EsYhUIyUhVCC5JLCqqVPDLTM8oAQDmNFnDqgAAAA&npsic=0&sa=X&ved=0ahUKEwiL2_Hon4_hAhXNZt4KHTOAACwQ-BYILw")

        end
    end
end