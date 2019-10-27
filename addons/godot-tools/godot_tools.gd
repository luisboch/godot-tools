tool
extends EditorPlugin

func _enter_tree():
    add_custom_type("Follow2D", "Node2D", preload("follow_2d.gd"), preload("hammer.png"))
    print("initializing")

func _exit_tree():
    print("finishing")
    remove_custom_type("Follow2D")

