extends Control

signal button_pressed
signal rotate_left
signal rotate_left_stop
signal rotate_right
signal rotate_right_stop

@onready var btn2 := %Button2
@onready var timer := %Timer
@onready var label := %Label
@onready var panel := %Panel
# Called when the node enters the scene tree for the first time.
func _ready():
	btn2.hide()
	panel.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 


func display_text_btn(text: String, btnText: String):
	panel.show()
	btn2.show()
	btn2.text = btnText
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	label.add_theme_font_size_override("font_size", 12)
	label.text = text

func display_text(text: String, time: float):
	panel.show()
	label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	label.add_theme_font_size_override("font_size", 12)
	label.text = text
	if time == -1:
		return
	timer.start(time)
	

func _on_timer_timeout():
	panel.hide()

func _on_button_2_pressed():
	btn2.hide()
	panel.hide()


func _on_button_2_mouse_entered():
	print("aaaaa")


func _on_panel_mouse_entered():
	print("bbbbb")


func _on_h_box_container_mouse_entered():
	rotate_left.emit()


func _on_h_box_container_mouse_exited():
	rotate_left_stop.emit()


func _on_h_box_container_2_mouse_entered():
	rotate_right.emit()


func _on_h_box_container_2_mouse_exited():
	rotate_right_stop.emit()
