module OnfleetClub
  class Worker < OnfleetClubObject
    include OnfleetClub::Actions::Create
    include OnfleetClub::Actions::List
    include OnfleetClub::Actions::Get
    include OnfleetClub::Actions::Save
    include OnfleetClub::Actions::Update
    include OnfleetClub::Actions::Delete
    include OnfleetClub::Actions::QueryMetadata

    def self.api_url
      '/workers'
    end
  end
end
