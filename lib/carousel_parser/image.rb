

class ImageExtractor

    SELECTORS = {
        "images": "div#cnt > script"
        }.freeze()

    PIMAGE = /data:image[^']+/.freeze()
    PID = /(?<=\[')(.*)(?='\])/.freeze()
    PFUNC = /\(function\(\)\{(.*?)\}\)\(\);/m.freeze()

    def self.extract(doc)
        script = doc.css(SELECTORS[:images]).last.text
        script.scan(PFUNC).each_with_object({}) do |(line), result|
            img = line[PIMAGE]
            id = line[PID]
            result[id] = img if img && id
          end
    end
    
end
