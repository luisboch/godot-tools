tool
extends "base_steering.gd";
var all_behaviors = []

func is_godot_tools_group():
	return true
	
func _enter_tree():
	._enter_tree()
	load_all_behaviors()

func load_all_behaviors(): 
	all_behaviors = []
	for n in get_children():
		if n.has_method("is_godot_tools") and n.is_godot_tools() \
			and n.has_method('is_godot_tools_behavior') and n.is_godot_tools_behavior():
			all_behaviors.append(n)

func calculate (delta: float, tgt_pos:Vector2) -> SteeringCalc:
	var allWeight: Vector2 = Vector2()
	for n in all_behaviors:
		if n.calc:
			if n.calc.velocity:
				allWeight += n.calc.velocity * n.weight
	return SteeringCalc.new(allWeight, allWeight.angle())
	
