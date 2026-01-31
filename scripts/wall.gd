extends Node2D



@export var max_hp: int
var hp

func _ready() -> void:
	hp = max_hp

func _process(delta: float) -> void:
	if hp<=0:
		zero_hp()

func zero_hp():
	pass
	
func reset():
	hp = max_hp
