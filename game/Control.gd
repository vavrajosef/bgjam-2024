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

var currentDialogue : Dialogue = null
var dialogueQueue := []

# Called when the node enters the scene tree for the first time.
func _ready():
	btn2.hide()
	panel.hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if currentDialogue == null and not dialogueQueue.is_empty():
		currentDialogue = dialogueQueue.pop_front()
		if currentDialogue.is_btn:
			display_text_btn(currentDialogue.label_text, currentDialogue.btn_text)
		else:
			display_text(currentDialogue.label_text, currentDialogue.timeout)

func append_display_text_btn(text: String, btnText: String):
	var new_dialogue : Dialogue = Dialogue.new()
	new_dialogue.is_btn = true
	new_dialogue.label_text = text
	new_dialogue.btn_text = btnText
	dialogueQueue.append(new_dialogue)

func append_display_text(text: String, time: float):
	var new_dialogue : Dialogue = Dialogue.new()
	new_dialogue.is_btn = false
	new_dialogue.label_text = text
	new_dialogue.timeout = time
	dialogueQueue.append(new_dialogue)

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
	currentDialogue = null
	panel.hide()

func _on_button_2_pressed():
	currentDialogue = null
	btn2.hide()
	panel.hide()

func _on_h_box_container_mouse_entered():
	rotate_left.emit()

func _on_h_box_container_mouse_exited():
	rotate_left_stop.emit()

func _on_h_box_container_2_mouse_entered():
	rotate_right.emit()

func _on_h_box_container_2_mouse_exited():
	rotate_right_stop.emit()
