extends Node

onready var Events = get_node('/root/Events')
const Card = preload('res://cards/Card.gd')

var cards = []

func _init():
	print('init executed')

func _ready():
	print('ready ready')
	Events.connect('COMMAND_ENTERED', self, 'check_command')

func add_card(card):
	cards.append(card)
	
func check_command(raw_command, command, params):
	for card in cards:
		if raw_command in card.command:
			execute_card(card.action, card.action_params)
			break
		if command in card.command:
			execute_card(card.action, card.action_params+Array(params))
			break

func _input(event):
	if event is InputEventKey and event.pressed:
		for card in cards:
			if event.scancode in card.shortcut:
				print(card.action_params)
				execute_card(card.action, card.action_params)
				break

func execute_card(action, params):
	Events.emit_signal(action, params)


# basic function to generate new cards
static func generate():
	randomize()
	var com = 'abcdefghijklmnopqrstuvwxyz'[randi()%26]
	print('command ', com)
	return {
		'command': [com],
		'shortcut': [KEY_C],
		'action': 'ORDER_MOVE',
		'action_params': [randi()%2 - 1, randi()%2 - 1]
	}
