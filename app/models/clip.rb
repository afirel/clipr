class Clip

  def self.create(content, provider = LocalClipProvider.new)
    provider.create(content)
  end

  def self.get(id, provider = LocalClipProvider.new)
    provider.get(id)
  end

end
