tool
extends "base_steering.gd"

func _enter_tree():
	._enter_tree()

func _ready():
	._ready()
	
func calculate(tgt_pos: Vector2):
	var dist:Vector2 = tgt_pos - global_position
	
	if abs(dist.length()) <  distance_threshold:
		return null
	
	var desired_velocity = dist.normalized() * max_speed
	var sterring = (desired_velocity - velocity) / mass;
	return velocity + sterring