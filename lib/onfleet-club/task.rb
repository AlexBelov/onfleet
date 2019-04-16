module OnfleetClub
  class Task < OnfleetClubObject
    include OnfleetClub::Actions::Create
    include OnfleetClub::Actions::Save
    include OnfleetClub::Actions::Update
    include OnfleetClub::Actions::Get
    include OnfleetClub::Actions::List
    include OnfleetClub::Actions::Delete
    include OnfleetClub::Actions::QueryMetadata

    def self.api_url
      '/tasks'
    end

    def complete
      # CURRENTLY DOESN'T WORK
      url = "#{self.url}/#{self.id}/complete"
      params = {"completionDetails" => {"success" => true }}
      OnfleetClub.request(url, :post, params)
      true
    end

  end
end
