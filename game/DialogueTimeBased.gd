extends Area3D

@export var text := ""
@export var time := 0.0
@export var is_repeatable := true

var already_visited := false

func _on_body_entered(body):
	if body is Player and not already_visited:
		get_parent().get_ui().append_display_text(text, time)
		if not is_repeatable:
			already_visited = true
