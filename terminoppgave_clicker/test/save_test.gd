extends Node2D
@onready var testlabel: Label = $testlabel

var save_path = "user://variable.save"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	testlabel.text = str(Global.testNum)


func _on_testbuttonplus_pressed() -> void:
	Global.testNum += 1

func _on_testbuttonminus_pressed() -> void:
	Global.testNum -= 1

func save():
	var file = FileAccess.open(save_path, FileAccess.WRITE)
	file.store_var(Global.testNum)

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path, FileAccess.READ)
		Global.testNum = file.get_var(Global.testNum)
	else:
		print("no data saved")
		Global.testNum = 0


func _on_save_button_pressed() -> void:
	save() # Replace with function body.


func _on_load_button_pressed() -> void:
	load_data() # Replace with function body.


func _on_exit_pressed() -> void:
	get_tree().quit # Replace with function body.
