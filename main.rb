require_relative "lib/carousel_parser/parser"
require_relative "lib/io"


def main()
    infile = "./files/van-gogh-paintings.html"
    outfile = "./files/expected-array.json"
    html = reader(infile)
    artworks = CarouselParser.parse(html)

    writer(outfile, serializer(artworks))
    puts "[SUCCESS] => Done! Check the output file at '#{outfile}'"
end


main