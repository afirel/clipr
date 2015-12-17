class ClipProviderFactory
  include Singleton

  DEFAULT_PROVIDER = LocalClipProvider

  def self.set_default_provider(provider = DEFAULT_PROVIDER.new)
    self.instance.default_provider = provider
  end

  def self.get_provider
    self.instance.default_provider || DEFAULT_PROVIDER.new
  end

  attr_accessor :default_provider

end
