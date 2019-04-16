module OnfleetClub
  class Webhook < OnfleetClubObject
    include OnfleetClub::Actions::Create
    include OnfleetClub::Actions::List
    include OnfleetClub::Actions::Save
    include OnfleetClub::Actions::Delete


    def self.api_url
      '/webhooks'
    end
  end
end
