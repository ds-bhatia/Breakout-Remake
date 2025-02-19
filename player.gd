extends CharacterBody2D

@export var speed = 500
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("left"):
		velocity.x = -1
	if Input.is_action_pressed("right"):
		velocity.x = 1
	velocity = velocity * speed
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
