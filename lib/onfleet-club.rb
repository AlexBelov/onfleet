require 'rest-client'
require 'json'
require 'base64'
require 'uri'

# Utils
require 'onfleet-club/util'

# Errors
require 'onfleet-club/errors/onfleet_error'
require 'onfleet-club/errors/authentication_error'
require 'onfleet-club/errors/invalid_request_error'
require 'onfleet-club/errors/connection_error'

# Actions
require 'onfleet-club/actions/create'
require 'onfleet-club/actions/find'
require 'onfleet-club/actions/save'
require 'onfleet-club/actions/update'
require 'onfleet-club/actions/get'
require 'onfleet-club/actions/list'
require 'onfleet-club/actions/delete'
require 'onfleet-club/actions/query_metadata'

# Resources
require 'onfleet-club/onfleet_object'
require 'onfleet-club/recipient'
require 'onfleet-club/destination'
require 'onfleet-club/address'
require 'onfleet-club/task'
require 'onfleet-club/organization'
require 'onfleet-club/admin'
require 'onfleet-club/team'
require 'onfleet-club/vehicle'
require 'onfleet-club/worker'
require 'onfleet-club/webhook'


module OnfleetClub
  @base_url = "https://onfleet.com/api/v2"

  class << self
    attr_accessor :api_key, :base_url, :encoded_api_key
  end

  def self.request api_url, method, params={}
    raise AuthenticationError.new("Set your API Key using OnfleetClub.api_key = <API_KEY>") unless @api_key

    begin
      response = RestClient::Request.execute(method: method, url: self.base_url+api_url, payload: params.to_json, headers: self.request_headers)

      if response != ''
        JSON.parse(response)
      end
    rescue RestClient::ExceptionWithResponse => e
      if response_code = e.http_code and response_body = e.http_body
        handle_api_error(response_code, JSON.parse(response_body))
      else
        handle_restclient_error(e)
      end
    rescue RestClient::Exception, Errno::ECONNREFUSED => e
      handle_restclient_error(e)
    end
  end

  private
    def self.request_headers
      {
        Authorization: "Basic #{self.encoded_api_key}",
        content_type: :json,
        accept: :json
      }
    end

    def self.encoded_api_key
      @encoded_api_key ||= Base64.urlsafe_encode64(@api_key)
    end

    def self.handle_api_error code, body
      case code
      when 400, 404
        raise InvalidRequestError.new(body["message"])
      when 401
        raise AuthenticationError.new(body["message"])
      else
        raise OnfleetClubError.new(body["message"])
      end
    end

    def self.handle_restclient_error e
      case e
      when RestClient::RequestTimeout
        message = "Could not connect to OnfleetClub. Check your internet connection and try again."
      when RestClient::ServerBrokeConnection
        message = "The connetion with onfleet terminated before the request completed. Please try again."
      else
        message = "There was a problem connection with OnfleetClub. Please try again. If the problem persists contact contact@onfleet.com"
      end

      raise ConnectionError.new(message)
    end
end
