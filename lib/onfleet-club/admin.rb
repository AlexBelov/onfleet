module OnfleetClub
  class Admin < OnfleetClubObject
    include OnfleetClub::Actions::Create
    include OnfleetClub::Actions::Save
    include OnfleetClub::Actions::Update
    include OnfleetClub::Actions::List
    include OnfleetClub::Actions::Delete
    include OnfleetClub::Actions::QueryMetadata

    def self.api_url
      '/admins'
    end
  end
end
