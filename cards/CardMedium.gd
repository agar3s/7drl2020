extends Container


const Card = preload("res://cards/Card.gd")
var card
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	print("id di", randi())
	var x = randi()%16
	var y = randi()%16
	$Type.text = ['magic', 'attack', 'equip', 'armor'][randi()%4]
	print("texture ", x, ' ', y)
	$Icon.texture.region.position.x += x * 22
	$Icon.texture.region.position.y += y * 22
	connect("mouse_entered", self, "on_hover")
	connect("mouse_exited", self, "on_exit")
	$Icon.modulate= Color.from_hsv(randf(), 0.37, 1.0);

func set_card(card):
	self.card = card

func on_hover():
	self.rect_position.y -= 20
	self.rect_position.x -= 12
	self.rect_scale.x = 1.25
	self.rect_scale.y = 1.25
	self.set("z", 5)

func on_exit():
	self.rect_position.y += 20
	self.rect_position.x += 12
	self.rect_scale.x = 1.0
	self.rect_scale.y = 1.0
	self.set("z", 0)
	
