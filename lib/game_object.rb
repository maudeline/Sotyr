class GameObject

  AVAILABLE_OPTIONS = {
    option: ''
  }.freeze

  def available_actions_for(_character)
    AVAILABLE_OPTIONS.keys
  end

  def interact(option, chef)
    AVAILABLE_OPTIONS.fetch(option)
  end
end
