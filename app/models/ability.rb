class Ability
  include CanCan::Ability

  def initialize(token)
    token ||= Token.new

    can     :read,    :all    if token.read?
    can     :update,  Fixture if token.write
    cannot  :destroy, :all
  end
end
