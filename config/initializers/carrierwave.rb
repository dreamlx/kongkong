::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "93vlzlK9UlO6UhZaVlrZ4RyVanIv5f1meAX_ofK2"
  config.qiniu_secret_key    = "7UGe9arh_jrxTQGa1WLba3D8xDZ-FbXOJSVYAJt7"
  config.qiniu_bucket        = "kongkong"
  config.qiniu_bucket_domain = "kongkong.qiniudn.com"
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocal      = "http"

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => 'AKIAIJ2FNAJJH2TW3FEQ',                        # required
    :aws_secret_access_key  => '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',                        # required
    :region                 => 'ap-southeast-1',                  # optional, defaults to 'us-east-1'
    #:host                   => 'tzk3d.herokuapp.com',             # optional, defaults to nil
    #:endpoint               => 'http://tzk3d.s3-website-ap-southeast-1.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'tzk3d'                     # required
  config.fog_public     = true                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}

end
