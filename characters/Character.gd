extends Node2D

# character sprites by @anactualpokemon
# taken from: https://opengameart.org/content/bw-surreal-office-rpg-1-bit-sprites-and-tiles

# Called when the node enters the scene tree for the first time.
func _ready():
	change_character()

func move_to(mov: Vector2):
	self.position += mov
	if mov.y > 0: $AnimationPlayer.play("down")
	if mov.y < 0: $AnimationPlayer.play("up")
	if mov.x < 0: $AnimationPlayer.play("left")
	if mov.x > 0: $AnimationPlayer.play("right")
		

func change_character():
	randomize()
	var character_index = randi()%8
	var character_index_offset = 0
	if character_index >= 4:
		character_index -= 4
		character_index_offset = 48
	
	var right_animation: Animation = $AnimationPlayer.get_animation('down')
	right_animation.track_set_key_value(0, 0, character_index_offset+character_index*3)
	right_animation.track_set_key_value(0, 1, character_index_offset+character_index*3+2)
	right_animation.track_set_key_value(0, 2, character_index_offset+character_index*3+1)
		
	var left_animation: Animation = $AnimationPlayer.get_animation('left')
	left_animation.track_set_key_value(0, 0, character_index_offset+character_index*3+12)
	left_animation.track_set_key_value(0, 1, character_index_offset+character_index*3+14)
	left_animation.track_set_key_value(0, 2, character_index_offset+character_index*3+13)

	var down_animation: Animation = $AnimationPlayer.get_animation('right')
	down_animation.track_set_key_value(0, 0, character_index_offset+character_index*3+12+12)
	down_animation.track_set_key_value(0, 1, character_index_offset+character_index*3+14+12)
	down_animation.track_set_key_value(0, 2, character_index_offset+character_index*3+13+12)

	var up_animation: Animation = $AnimationPlayer.get_animation('up')
	up_animation.track_set_key_value(0, 0, character_index_offset+character_index*3+12+12*2)
	up_animation.track_set_key_value(0, 1, character_index_offset+character_index*3+14+12*2)
	up_animation.track_set_key_value(0, 2, character_index_offset+character_index*3+13+12*2)

	$AnimatedSprite.frame = character_index_offset+character_index*3+2
