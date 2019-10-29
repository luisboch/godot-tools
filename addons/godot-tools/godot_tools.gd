tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("Follow2D", "Node2D", preload("src/follow_2d.gd"), preload("icons/follow.png"))
	add_custom_type("Flee2D", "Node2D", preload("src/flee_2d.gd"), preload("icons/flee.png"))
	add_custom_type("Arrive2D", "Node2D", preload("src/arrive_2d.gd"), preload("icons/arrive.png"))
	add_custom_type("Pursuit2D", "Node2D", preload("src/pursuit_2d.gd"), preload("icons/pursuit.png"))
	add_custom_type("LookAt2D", "Node2D", preload("src/look_at_2d.gd"), preload("icons/binocular.png"))

func _exit_tree():
    remove_custom_type("Follow2D")
    remove_custom_type("Flee2D")
    remove_custom_type("Arrive2D")
    remove_custom_type("Pursuit2D")
    remove_custom_type("LookAt2D")