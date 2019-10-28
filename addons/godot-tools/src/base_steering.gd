tool
extends Node2D

export var target_node_path:NodePath setget set_target_node_path, get_target_node_path
var target_node : Node2D setget set_target_node, get_target_node
export var target_position : Vector2 setget set_target_position, get_target_position
# warning-ignore:unused_class_variable
export var mass = 2.0
# warning-ignore:unused_class_variable
export var max_speed = 500
# warning-ignore:unused_class_variable
export var distance_threshold = 50
export var change_node_rotation = true
var from_node:Node2D
var velocity:Vector2

# warning-ignore:unused_argument
func calculate (delta: float, tgt_pos:Vector2) -> SteeringCalc:
	return SteeringCalc.new(null, null)

func _enter_tree():
	from_node = resolve_node()
	if not from_node:
		print("Expecting be a child of KinematicBody2D, aborting...")

func _ready():
	if target_node_path:
		target_node = get_node(target_node_path)
		if target_node:
			set_physics_process(true)
		
func set_target_node_path(nd):
	target_node_path  = nd
	set_physics_process(nd != null)
	
func get_target_node_path():
	return target_node_path
	
# warning-ignore:unused_argument
func _process(delta):
	
	if Engine.is_editor_hint() or not visible:
		set_physics_process(false)
		return
		
	var tgt_pos = resolve_target_pos()
	
	if tgt_pos == null:
		return
	
	var calc = calculate(delta, tgt_pos)
	
	if calc :
		if calc.velocity:
			velocity  = from_node.move_and_slide(calc.velocity)
			
		if calc.angle and change_node_rotation:
			from_node.rotation = calc.angle
	
func resolve_target_pos():
	if target_node :
		return target_node.global_position
	return target_position

func resolve_node() -> Node2D:
	if from_node:
		return from_node
		
	var check = get_parent()
	while not(check is Node2D) \
		and not (check is KinematicBody2D) \
		and not (check is RigidBody2D) \
		and not (check is Area2D):
		check = check.get_parent()
	return check;
	
func set_target_node(nd):
	target_node = nd
	set_physics_process(nd != null)
	
func get_target_node():
	return target_node
	
func set_target_position(vl):
	target_position = vl
	set_physics_process(vl != null)
	
func get_target_position():
	return target_position
	
class SteeringCalc:
	var velocity
	var angle
	func _init(vel, angle):
		self.velocity = vel
		self.angle = angle