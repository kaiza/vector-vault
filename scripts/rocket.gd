extends CharacterBody2D

@export var speed: float = 300
@export var turn_duration: float = 0.25:
	set(value): turn_duration = max(value, 0.001)

const NE = Vector2(1, -1).normalized()
const SE = Vector2(1, 1).normalized()
const SW = Vector2(-1, 1).normalized()
const NW = Vector2(-1, -1).normalized()

var current_direction: Vector2 = NE
var target_direction: Vector2 = NE

func _ready() -> void:
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
	$Polygon2D.rotation = current_direction.angle()

func _physics_process(delta: float) -> void:
	current_direction = current_direction.lerp(target_direction, min(delta / turn_duration, 1.0)).normalized()
	velocity = current_direction * speed
	move_and_slide()
	$Polygon2D.rotation = current_direction.angle()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("tap_up"):
		target_direction = NE
	elif event.is_action_pressed("tap_right"):
		target_direction = SE
	elif event.is_action_pressed("tap_down"):
		target_direction = SW
	elif event.is_action_pressed("tap_left"):
		target_direction = NW
	elif event is InputEventScreenTouch and event.pressed:
		_handle_touch(event.position)

func _handle_touch(pos: Vector2) -> void:
	var center = get_viewport_rect().size / 2
	var dx = pos.x - center.x
	var dy = pos.y - center.y
	if abs(dy) > abs(dx):
		if dy < 0:
			target_direction = NE
		else:
			target_direction = SW
	else:
		if dx > 0:
			target_direction = SE
		else:
			target_direction = NW
