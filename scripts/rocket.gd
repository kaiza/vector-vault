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
