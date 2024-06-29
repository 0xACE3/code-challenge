require 'nokogiri'
require "json"

def parser(content)
    doc = Nokogiri::HTML(content)
    artworks = parse_artworks(doc)
    
    return {artworks: artworks}
end


def parse_artworks(doc)
    result = []
    paintings = doc.css('g-scrolling-carousel.wqBQjd > div > div > div')
    images = get_images(doc)
    paintings.each do |painting|
        result.append(extract(painting, images))
    end

    return result
end


def extract(painting, images)
    name = painting.css("a").attr("aria-label").value
    extensions = painting.css('div.ellip.klmeta').map(&:text)
    link = painting.css('a').attr('href').value
    id = painting.css('img').attr('id').value
    image = images[id] || nil
    {
        name: name,
        extensions: extensions,
        link: "https://www.google.com#{link}",
        image: image
    }
end


def get_images(doc)
    result = {}
    img_pattern = /data:image[^']+/
    id_pattern = /(?<=\[')(.*)(?='\])/
    script = doc.css('div#cnt > script').last.text
    
    script.split("(function(){").each do |line|
        img = line.match(img_pattern).to_s
        id = line.match(id_pattern).to_s
        if img.empty? || id.empty?
            next
        end

        result[id] = img
    end

    return result
end
