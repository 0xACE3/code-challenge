require_relative "lib/parser"
require_relative "lib/io"


def main()
    infile = "./files/van-gogh-paintings.html"
    outfile = "./files/expected-array.json"

    html = reader(infile)
    artworks = parser(html)

    writer(outfile, serializer(artworks))
end
main