tool
extends "base_steering.gd"

const flee2d_gd = preload("flee_2d.gd") # Relative path
onready var flee = flee2d_gd.new()

export var ignore_distance = 300

func calculate(delta:float, tgt_pos: Vector2) -> SteeringCalc:
	flee.from_node = from_node
	flee.ignore_distance = ignore_distance
	
	if target_steering_node:
		var times = target_node.global_position.distance_to(from_node.global_position) / max_speed
		tgt_pos = target_node.global_position + target_steering_node.velocity * times
		return flee.calculate(delta, tgt_pos)
	else:
		print("Can't identify target sterring node, using default flee")
		return flee.calculate(delta, tgt_pos)