tool
extends "base_steering.gd"

export var use_ray_cast = true

func calculate(delta: float, tgt_pos: Vector2) -> SteeringCalc:
	return SteeringCalc.new(null, (tgt_pos - global_position).angle())