class Character

  attr_reader :id
  attr_accessor :character_first_name, :character_last_name, :character_job_title, :actor_first_name, :actor_last_name, :show

  def initialize(hash)
    @id = hash["id"]
    @character_first_name = hash["character_first_name"]
    @character_last_name = hash["character_last_name"]
    @character_job_title = hash["character_job_title"]
    @actor_first_name = hash["actor_first_name"]
    @actor_last_name = hash["actor_last_name"]
    @show = hash["show"]
  end

  def full_name
    "#{character_first_name} #{character_last_name}"
  end

  def self.find(id)
    self.new(Unirest.get("http://localhost:3000/characters/#{id}").body)
  end

  def self.all
    api_characters_array = Unirest.get("http://localhost:3000/characters").body
    @characters = []
    api_characters_array.each { |api_character| @characters << Character.new(api_character)}
    @characters
  end

  def self.destroy(id)
    Unirest.delete("http://localhost:3000/characters/#{id}", headers:{"Accept" => "application/json"}).body
  end
end