extends Node3D

signal sequence_win_sig

@export var firstVisibility := true
@export var secondVisibility := true
@export var thirdVisibility := true
var win_sequence := [4, 2, 3]

@onready var stone1 := %stone1
@onready var stone2 := %stone2
@onready var stone3 := %stone3

@onready var stone1handle := [%gem11, %gem12, %gem13, %gem14, %gem15]
@onready var stone2handle := [%gem21, %gem22, %gem23, %gem24, %gem25]
@onready var stone3handle := [%gem31, %gem32, %gem33, %gem34, %gem35]

@onready var stonesHandles := [stone1handle, stone2handle, stone3handle]
var currentVisibles := [5, 5, 5]
# Called when the node enters the scene tree for the first time.
func _ready():
	stone1.visible = firstVisibility
	stone2.visible = secondVisibility
	stone3.visible = thirdVisibility


func _on_gem_visibility_update(handleIndex: int):
	var visibleCount = currentVisibles[handleIndex]
	var currentStoneHandle = stonesHandles[handleIndex]
	if visibleCount == 5:
		for gem in currentStoneHandle:
			gem.visible = false
		visibleCount = 0
	else:
		currentStoneHandle[visibleCount].visible = true
		visibleCount += 1
	currentVisibles[handleIndex] = visibleCount
	var is_win := true
	for i in 3:
		if currentVisibles[i] != win_sequence[i]:
			is_win = false
			break
	if is_win:
		sequence_win_sig.emit()
	
