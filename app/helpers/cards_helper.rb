module CardsHelper
  ##
  # Check if a card has access to a door
  ##
  def has_access?(access_log, access_groups)
    doors = access_groups.map(&:doors).flatten.uniq
    doors.map(&:name).include? access_log.door
  end
end
