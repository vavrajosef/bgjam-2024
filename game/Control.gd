extends Control

signal button_pressed

@onready var btn := %Button
# Called when the node enters the scene tree for the first time.
func _ready():
	btn.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass 


func _on_button_pressed():
	button_pressed.emit()
