require 'game_object'
require 'cooking_process'

class Fire < GameObject
  AVAILABLE_OPTIONS = {
    cook: ->(fire) { CookingProcess.new(fire) }
  }.freeze

  def available_actions_for(_character)
    AVAILABLE_OPTIONS.keys
  end

  def interact(option)
    AVAILABLE_OPTIONS.fetch(option).call(self)
  end
end
