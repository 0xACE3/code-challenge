require_relative 'carousel'
require_relative 'image'
require 'nokogiri'
require "json"


class CarouselParser
    
    SELECTORS = {
        "carousels": "g-scrolling-carousel > div > div > div",
    }.freeze()  
    
    def self.parse(content)
        new(Nokogiri::HTML(content)).results()
    end
    
    def initialize(doc)
        @doc = doc
    end
    
    def results()
        {
            artworks: parse_carousels()
        }
    end
    
    private 
    
    def parse_carousels()
        carousels = @doc.css(SELECTORS[:carousels])
        images = ImageExtractor.extract(@doc)
        
        count = 0
        carousels.each_with_object([]) do |carousel, result|
            count += 1
            begin
                result << CarouselExtractor.extract(carousel, images)
            rescue => exception
                puts "[SKIP] => Message: `#{exception.message}` on #{count}-th Carousel\n"
            end
        end
    end     
end
