class Location

  attr_reader :name, :contents

  def initialize(name, contents)
    @name = name
    @contents = contents
  end
end
