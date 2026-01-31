extends Node



func _on_github_pressed() -> void:
	OS.shell_open("https://github.com/ciaba17/td-jam")


func _on_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_git_hub_pressed() -> void:
	pass # Replace with function body.
