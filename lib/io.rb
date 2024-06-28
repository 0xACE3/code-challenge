

def reader(file)
  file = File.open(file, 'r')
  content = file.read
  file.close
  content
end


def writer(file, content)
  file = File.open(file, 'w')
  file.write(content)
  file.close
end


def serializer(content)
  JSON.pretty_generate(content)
end


def deserializer(content)
  JSON.parse(content)
end