module OnfleetClub
  class Recipient < OnfleetClubObject
    include OnfleetClub::Actions::Create
    include OnfleetClub::Actions::Update
    include OnfleetClub::Actions::Save
    include OnfleetClub::Actions::Find
    include OnfleetClub::Actions::Get
    include OnfleetClub::Actions::QueryMetadata

    def self.api_url
      "/recipients"
    end
  end
end
