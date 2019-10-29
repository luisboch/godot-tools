tool
extends "base_steering.gd"

export var scale_by_proximity = false

func calculate(delta:float, tgt_pos: Vector2) -> SteeringCalc:
	var dist:Vector2 = from_node.global_position - tgt_pos
	
	if abs(dist.length()) >  distance_threshold:
		return null
	
	var desired_velocity = dist.normalized() * max_speed
	var sterring = (desired_velocity - velocity) / mass;
	if scale_by_proximity:
		sterring *= 1 - (dist.length() / distance_threshold)
	var vel = velocity + sterring
	return SteeringCalc.new(vel, vel.angle())