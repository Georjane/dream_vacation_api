class UsersRepresenter
  def initialize(users)
    @users = users
  end

  def as_json
    users.map do |user|
      {
        id: user.id,
        username: user.username,
      }
    end
  end

  private

  attr_reader :users
end