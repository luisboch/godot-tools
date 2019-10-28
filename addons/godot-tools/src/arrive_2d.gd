tool
extends "base_steering.gd"
export var slow_radius:float = 200.0

func _enter_tree():
	._enter_tree()

func _ready():
	._ready()
	
func calculate(delta:float, tgt_pos: Vector2) -> SteeringCalc:
	var dist = global_position.distance_to(tgt_pos)
	
	if dist <  distance_threshold:
		return null

	var desired_velocity = (tgt_pos - global_position).normalized() * max_speed
	
	if dist < slow_radius:
		desired_velocity *= (dist / slow_radius)
	
	var sterring = (desired_velocity - velocity) / mass;
	var vel = velocity + sterring
	return SteeringCalc.new(vel, vel.angle())