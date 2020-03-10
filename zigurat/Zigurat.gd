extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = 'text'
onready var Events = get_node('/root/Events')

const Card = preload('res://cards/Card.gd')


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	Events.connect('ORDER_MOVE', self, 'on_move_triggered')
	
	# test basic preparation deck
	
	var north_card = Card.new({
		'id': 'move_north',
		'command': ['north', 'n', 'up', 'move north'],
		'shortcut': [KEY_UP, KEY_W],
		'action': 'ORDER_MOVE',
		'action_params': [0, -1]
	})
	$DeckManager.add_card(north_card)
	
	var west_card = Card.new({
		'id': 'move_west',
		'command': ['west', 'w', 'left', 'move left'],
		'shortcut': [KEY_LEFT, KEY_A],
		'action': 'ORDER_MOVE',
		'action_params': [-1, 0]
	})
	$DeckManager.add_card(west_card)
	
	var south_card = Card.new({
		'id': 'move_south',
		'command': ['south', 's', 'down', 'move south'],
		'shortcut': [KEY_DOWN, KEY_S],
		'action': 'ORDER_MOVE',
		'action_params': [0, 1]
	})
	$DeckManager.add_card(south_card)
	
	var east_card = Card.new({
		'id': 'move_east',
		'command': ['east', 'e', 'right', 'move east'],
		'shortcut': [KEY_RIGHT, KEY_D],
		'action': 'ORDER_MOVE',
		'action_params': [1, 0]
	})
	$DeckManager.add_card(east_card)
	
	$DeckManager.add_card(Card.new($DeckManager.generate()))


func on_move_triggered(params: Array):
	
	if params.size() == 0:
		return
	var mov = Vector2(params[0]*32, params[1]*32)
	
	var tile = $CanvasLayer/TileMap.get_cell(($CanvasLayer/Character.position.x+mov.x)/32, ($CanvasLayer/Character.position.y+mov.y)/32)
	if tile != 1:
		$CanvasLayer/Character.move_to(mov)

