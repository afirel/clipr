require 'aws-sdk-core'

class S3ClipProvider

  def initialize
    @s3 = Aws::S3::Client.new
    @bucket = ENV['AWS_S3_BUCKET']
    Rails.logger.info "S3 bucket: #{bucket}"
  end

  def create(content)
    Rails.logger.info ENV.inspect
    Digest::MD5.hexdigest(Time.now.to_s + content).tap do |id|
			@s3.put_object(bucket: bucket, key: id, body: content)
		end
  end

  def get(id)
    resp = @s3.get_object(bucket: bucket, key: id)
    resp.body.read
  end

	private
	attr_reader :bucket, :s3
end
