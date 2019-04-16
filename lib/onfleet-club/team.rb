module OnfleetClub
  class Team < OnfleetClubObject
    include OnfleetClub::Actions::List
    include OnfleetClub::Actions::Get

    def self.api_url
      '/teams'
    end
  end
end
