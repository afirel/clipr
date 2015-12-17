class Clip

  def self.create(content, provider = ClipProviderFactory.get_provider)
    provider.create(content)
  end

  def self.get(id, provider = ClipProviderFactory.get_provider)
    provider.get(id)
  end

end
