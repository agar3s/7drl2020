extends RichTextLabel

onready var Events = get_node('/root/Events')

func _ready():
	Events.connect('ORDER_MOVE', self, 'log_move')

func logger(message):
	self.text += '\n > ' + message
	
func log_move(params: Array):
	if params.size() == 0:
		self.logger('specify a direction to go [(n)orth, (w)est, (s)outh, (e)ast]')
		return
	var dir = params[0]
	var dirs = {
		'left': 'go west',
		'w': 'go west',
		'west': 'go west',
		'right': 'go east',
		'east': 'go east',
		'e': 'go east',
		'up': 'go north',
		'north': 'go north',
		'n': 'go north',
		'down': 'go south',
		'south': 'go south',
		's': 'go south'
	}
	#self.logger(dirs[dir])
