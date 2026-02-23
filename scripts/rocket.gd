extends CharacterBody2D

@export var speed: float = 300

const NE = Vector2(1, -1).normalized()
const SE = Vector2(1, 1).normalized()
const SW = Vector2(-1, 1).normalized()
const NW = Vector2(-1, -1).normalized()

var direction: Vector2 = NE

func _physics_process(_delta: float) -> void:
	velocity = direction * speed
	move_and_slide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("tap_up"):
		direction = NE
	elif event.is_action_pressed("tap_right"):
		direction = SE
	elif event.is_action_pressed("tap_down"):
		direction = SW
	elif event.is_action_pressed("tap_left"):
		direction = NW
	elif event is InputEventScreenTouch and event.pressed:
		_handle_touch(event.position)

func _handle_touch(pos: Vector2) -> void:
	var center = get_viewport_rect().size / 2
	var dx = pos.x - center.x
	var dy = pos.y - center.y
	if abs(dy) > abs(dx):
		if dy < 0:
			direction = NE
		else:
			direction = SW
	else:
		if dx > 0:
			direction = SE
		else:
			direction = NW
