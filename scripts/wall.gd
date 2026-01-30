class_name wall
extends entity
@export var max_hp: int
var hp

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hp = max_hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hp<=0:
		zero_hp()

func zero_hp():
	pass
	
# Called when you neen to reset the match
func reset():
	hp = max_hp
