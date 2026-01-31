extends Node2D

@export var enemy_scene: PackedScene
@export var spawn_interval: float = 3.0
@export var spawn_count: int = 1
@export var randomize_inside_area: bool = true

@onready var timer: Timer = $Timer

func _ready():
	timer.wait_time = spawn_interval
	timer.timeout.connect(_on_Timer_timeout)
	timer.start()

func _on_Timer_timeout():
	for i in range(spawn_count):
		spawn_enemy()
		print("spawned")

func spawn_enemy():
	if enemy_scene == null:
		return

	var enemy = enemy_scene.instantiate()

	var spawn_pos = global_position
	if randomize_inside_area:
		spawn_pos = get_random_point_inside_area()

	enemy.global_position = spawn_pos
	get_tree().current_scene.add_child(enemy)

func get_random_point_inside_area() -> Vector2:
	var shape = $Area2D/CollisionShape2D.shape
	if shape is RectangleShape2D:
		var x = randf_range(-shape.extents.x, shape.extents.x)
		var y = randf_range(-shape.extents.y, shape.extents.y)
		return global_position + Vector2(x, y)
	elif shape is CircleShape2D:
		var angle = randf() * TAU
		var r = sqrt(randf()) * shape.radius
		return global_position + Vector2(cos(angle), sin(angle)) * r
	return global_position
