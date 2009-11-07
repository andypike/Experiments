require 'net/http'
require 'json'

class TwitterAPI
  def get (path, user_name = nil, password = nil)
    send_request(:get, path, nil, user_name, password)
  end

  def post (path, data, user_name = nil, password = nil)
    send_request(:post, path, data, user_name, password)
  end

  def send_request(method, path, data, user_name, password)
    if(!user_name) then user_name = @user_name end
    if(!password) then password = @password end

    if(!user_name || !password)
      puts "You need to login first"

      return nil
    else
      url = URI.parse("http://twitter.com/#{path}.json")

      if(method == :post)
        req = Net::HTTP::Post.new(url.path)
        req.set_form_data data
      else
        req = Net::HTTP::Get.new(url.path)
      end

      req.basic_auth user_name, password
      res = Net::HTTP.start(url.host, url.port) { |http|
        http.request(req)
      }
      response = TwitterResponse.new(res.code.to_i, JSON.parse(res.body))

      if(response.status_code != 200)
        puts "This command failed with code #{response.status_code} because #{response.data['error']}"
      end

      return response
    end
  end

  def cache_credentials(user_name, password)
    @user_name = user_name
    @password = password
  end

  private :send_request
end