class Clip < Struct.new(:id)

  def self.create(content, provider = ClipProviderFactory.get_provider)
    id = provider.create(content)
    Clip.new(id)
  end

  def self.get(id, provider = ClipProviderFactory.get_provider)
    provider.get(id)
  end

end
