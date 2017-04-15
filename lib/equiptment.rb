class Equiptment
  attr_reader :name, :quality, :type

  def initialize(name, quality)
    @name = name
    @quality = quality
    @type = :equiptment
  end
end
