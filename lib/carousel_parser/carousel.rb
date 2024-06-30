

class CarouselExtractor

    SELECTORS = {
        "name": "a",
        "extensions": "div.ellip.klmeta",
        "link": "a",
        "image": "img"
    
    }.freeze()

    URL = "https://www.google.com".freeze()

    def self.extract(carousel, images)
        {
            name: carousel.css(SELECTORS[:name]).attr("aria-label").value,
            extensions: carousel.css(SELECTORS[:extensions]).map(&:text),
            link: "#{URL}#{carousel.css(SELECTORS[:link]).attr('href').value}",
            image: images[carousel.css(SELECTORS[:image]).attr('id').value] || nil
        }
    end

end