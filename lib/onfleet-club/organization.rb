module OnfleetClub
  class Organization < OnfleetClubObject

    class << self
      def get
        url = "/organization"
        response  = OnfleetClub.request(url, :get)
        Util.constantize("#{self}").new(response)
      end

      def get_delegatee_details id
        url = "/organizations/#{id}"
        response  = OnfleetClub.request(url, :get)
        Util.constantize("#{self}").new(response)
      end
    end

  end
end
