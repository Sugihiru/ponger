extends CharacterBody2D


var direction = Vector2()
var speed = 20_000

func _ready():
	const possible_angles = [-0.75, -0.25, 0.25, 0.75]
	
	direction.x = possible_angles[randi() % possible_angles.size()] + randf_range(-0.1, 0.1)
	direction.y = possible_angles[randi() % possible_angles.size()] + randf_range(-0.1, 0.1)
	direction = direction.normalized()

func _process(delta: float):
	velocity = speed * delta * direction
	move_and_slide()
	if get_slide_collision_count() > 0:
		var collision = get_slide_collision(0)
		if collision != null:
			direction = direction.bounce(collision.get_normal()) + Vector2(randf_range(-0.1, 0.1), randf_range(-0.1, 0.1))
			direction = direction.normalized()
