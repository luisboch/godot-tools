tool
extends "base_steering.gd"
	
func calculate(delta:float, tgt_pos: Vector2) -> SteeringCalc:
	if target_steering_node:
		var times = target_node.global_position.distance_to(from_node.global_position) / max_speed
		tgt_pos = target_node.global_position + target_steering_node.velocity * times
		var dist = from_node.global_position.distance_to(tgt_pos)
		var desired_velocity = (tgt_pos - global_position).normalized() * max_speed
		var sterring = (desired_velocity - velocity) / mass;
		var vel = velocity + sterring
		return SteeringCalc.new(vel, vel.angle())
	else:
		print("Can't identify target sterring node, using default follow")
		var dist = from_node.global_position.distance_to(tgt_pos)
		var desired_velocity = (tgt_pos - global_position).normalized() * max_speed
		var sterring = (desired_velocity - velocity) / mass;
		var vel = velocity + sterring
		return SteeringCalc.new(vel, vel.angle())