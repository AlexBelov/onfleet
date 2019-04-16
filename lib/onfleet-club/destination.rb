module OnfleetClub
  class Destination < OnfleetClubObject
    include OnfleetClub::Actions::Create
    include OnfleetClub::Actions::Save
    include OnfleetClub::Actions::Get
    include OnfleetClub::Actions::QueryMetadata

    def self.api_url
      '/destinations'
    end
  end
end
