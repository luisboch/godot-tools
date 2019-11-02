tool
extends "base_steering.gd"

export var ignore_distance = 300

func calculate(delta:float, tgt_pos: Vector2) -> SteeringCalc:
	var dist:Vector2 = from_node.global_position - tgt_pos
	if dist.length() > ignore_distance:
		return SteeringCalc.new(null, null)
		
	var desired_velocity = dist.normalized() * max_speed
	var sterring = (desired_velocity - velocity) / mass;
	var vel = velocity + sterring
	return SteeringCalc.new(vel, vel.angle())