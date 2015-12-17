if ['AWS_ACCESS_KEY_ID', 'AWS_SECRET_ACCESS_KEY', 'AWS_REGION', 'AWS_S3_BUCKET'].all? { |k| ENV.include?(k) }
  Rails.logger.info "Using S3ClipProvider"
  ClipProviderFactory.set_default_provider(S3ClipProvider.new)
end
