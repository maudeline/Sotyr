require 'game_object'
require 'cooking_process'

class Fire < GameObject
  AVAILABLE_OPTIONS = {
    cook: ->(fire, chef) { CookingProcess.new(fire, chef) }
  }.freeze

  def available_actions_for(_character)
    AVAILABLE_OPTIONS.keys
  end

  def interact(option, character)
    AVAILABLE_OPTIONS.fetch(option).call(self, character)
  end
end
