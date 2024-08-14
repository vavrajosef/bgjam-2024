extends Area3D

@export_multiline var text := ""
@export_multiline var btnText := ""
@export var is_repeatable := true

var already_visited := false

func _on_body_entered(body):
	if body is Player and not already_visited:
		get_parent().get_ui().append_display_text_btn(text, btnText)
		if not is_repeatable:
			already_visited = true
