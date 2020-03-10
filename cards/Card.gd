extends Resource

class_name Card

enum CARD_TYPES {
	SKILL=1,
	EQUIP=2,
	ATTACK=3,
	MAGIC=4
}

# unique card id, this could be used as parameter for special cards
var id = ''
# card type, define the way this card could be used in game
var type = ''
# define the command to execute this card via command line,
# if not present could be executed by using another card
var command: Array = []
# key or keys to be used to execute the card via keyboard
var shortcut = 0
var action = ''
var action_params = []

# a list of requirements to accomplish by the character to execute
# this card
var requirements = {}
# attributes consumption after use this card
var cost = {}
# max number of executions of this card.
var durability = 0
# timeouts before be able to execute this card.
var coldowns = {}
var description = ''
var icon = ''

func _init(params):
	self.id = params.get('id', 0)
	self.type = params.get('type', CARD_TYPES.MAGIC)
	self.command = params.get('command', [])
	self.shortcut = params.get('shortcut', 0)
	self.action = params.get('action', '')
	self.action_params = params.get('action_params', [])
	self.requirements = params.get('requirements', {})
	self.cost = params.get('cost', {})
	self.durability = params.get('durability', {})
	self.coldowns = params.get('coldowns', {})
	self.description = params.get('description', '')
	self.icon = params.get('icon', '')

