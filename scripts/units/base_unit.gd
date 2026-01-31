extends CharacterBody2D



@export var level: int = 1

@export var max_health: float = 100.0
var health: float = max_health

@export var physical_atk: float = 10.0
@export var magic_atk: float = 0.0
@export var physical_def: float = 5.0
@export var magic_def: float = 3.0

@export var atk_speed: float = 1.0  # Attacks per second
@export var attack_range: float = 40.0
@export var speed: float = 50.0


var target: CharacterBody2D = null
var can_attack := true

@onready var attack_timer: Timer = $Timer

func _ready():
	health = max_health
	attack_timer.wait_time = 1.0 / atk_speed 

func _physics_process(delta):
	if target:
		move_towards_target(delta)

func move_towards_target(delta):
	if position.distance_to(target.position) > attack_range:
		velocity = (target.position - position).normalized() * speed
		move_and_slide()
	else:
		attack_target()

func attack_target():
	if can_attack and target:
		var total_damage = compute_damage(target)
		target.take_damage(total_damage)
		can_attack = false
		attack_timer.start()

func _on_Timer_timeout():
	can_attack = true


func compute_damage(target) -> float:
	var base_damage = physical_atk
	var reduction = target.physical_def * 0.1
	return max(base_damage - reduction, 1) # 1 damage minimum

func take_damage(amount: float):
	health -= amount
	if health <= 0:
		die()

func die():
	queue_free()
