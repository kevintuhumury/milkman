module Milkman
  module Utility

    def sign(shared_secret, parameters)
      parameters.delete(:api_sig)
      parameters[:api_sig] = Digest::MD5.hexdigest format(shared_secret, parameters)
      parameters
    end

    def format(shared_secret, parameters)
      [ shared_secret, parameters.sort.flatten.join ].join
    end

    def encode(options)
      URI::encode_www_form options
    end

    def request_url(options)
      [ BASE_URL, encode(options) ].join "?"
    end

    def default_options
      { perms: "delete", format: "json" }
    end

  end
end
