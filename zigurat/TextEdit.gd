extends LineEdit

onready var Events = get_node('/root/Events')

func _ready():
	self.connect('text_entered', self, 'capture_command')
	
func capture_command(_row):
	var raw_command = self.text
	var params = raw_command.split(' ')
	var command = params[0]
	params.remove(0)
	Events.emit_signal('COMMAND_ENTERED', raw_command, command, params)
	self.text = ''
