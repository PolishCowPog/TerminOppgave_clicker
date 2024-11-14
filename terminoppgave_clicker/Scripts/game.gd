extends Node2D

@onready var show_energy: Label = $Show_Energy
@onready var show_epc: Label = $Show_EPC
@onready var show_eps: Label = $Show_EPS
@onready var energy_button: Button = $Energy_button
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var save_path = "user://Energy_Clicker.save"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(Global.testNum)
	load_data()
	

func _process(delta: float) -> void:
	show_energy.text = "Energy: " + str(Global.energy)
	show_epc.text = "Energy per click : " + str(Global.energy_per_click)
	show_eps.text = "Energy per second: " + str(Global.energy_per_second)


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn") # Replace with function body.


func _on_energy_button_pressed() -> void:
	Global.energy += Global.energy_per_click
	animation_player.play("energy_click_anim")
	save()

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Global.energy)
	file.store_var(Global.energy_per_click)
	file.store_var(Global.energy_per_second)

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Global.energy = file.get_var(Global.energy)
		Global.energy_per_click = file.get_var(Global.energy_per_click)
		Global.energy_per_second = file.get_var(Global.energy_per_second)
	else:
		print("no data saved")
		Global.energy = 0
		Global.energy_per_click = 1
		Global.energy_per_second = 0
