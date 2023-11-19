extends CharacterBody2D

@export var player_id: int

var up_input_action: String
var down_input_action: String
var speed = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	if player_id == 1:
		up_input_action = "p1_move_up"
		down_input_action = "p1_move_down"
	elif player_id == 2:
		up_input_action = "p2_move_up"
		down_input_action = "p2_move_down"
	else:
		printerr("Init failed: invalid player_id set")
		get_tree().quit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	velocity = Vector2(0, Input.get_axis(up_input_action, down_input_action) * speed)
	move_and_collide(velocity)
