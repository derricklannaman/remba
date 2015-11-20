# require "refile/s3"

# aws = {
#   access_key_id: ENV['AWSKEY'],
#   secret_access_key: ENV['AWSSEC'],
#   region: "sa-east-1",
#   bucket: ENV['rembamedia']
# }

# Refile.cache = Refile::S3.new(prefix: "cache", **aws)
# Refile.store = Refile::S3.new(prefix: "store", **aws)
