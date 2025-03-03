extends RigidBody2D
@export var speed = 500
var angle
var velocity = Vector2.ZERO

func _ready() -> void:
	position = Vector2(578, 320)
	angle = randf_range(PI/4, 3*PI/4)
	velocity.x = speed * cos(angle)
	velocity.y = speed * sin(angle)
	velocity = velocity.normalized()

func _process(delta: float) -> void:
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity = velocity.bounce(collision_info.get_normal())
	position += velocity * speed * delta
