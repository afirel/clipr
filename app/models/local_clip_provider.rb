class LocalClipProvider

  attr_reader :path

  def initialize(path = File.join(Rails.root, 'tmp'))
    @path = path
  end

  def create(content)
    id = Digest::MD5.hexdigest(Time.now.to_s + content)
    File.open(File.join(path, id), 'wb+') do |io|
      io << content
    end
    id
  end

  def get(id)
    clip_path = File.join(path, id)
    return nil unless File.exists?(clip_path)
    File.read(clip_path)
  end

end
