module Serializers
  def serialize_items(items, file_name)
    file = File.open(file_name, 'w')
    obj_strings = []
    items.each do |item|
      obj_strings.push(JSON.generate(item).to_s)
    end
    file.write(obj_strings)
    file.close
  end

  def serialize_all(data)
    serialize_items(data[0], data[1])
    serialize_items(data[2], data[3])
    serialize_items(data[4], data[5])
  end
end
