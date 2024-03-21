extends Node3D

@export_flags_3d_physics var fragment_collision_layer:int = 1
@export_flags_3d_physics var fragment_collision_mask:int = 1
@export var explosion_speed:float = 4
@export var min_frag_lifetime:float = 1.2
@export var max_frag_lifetime:float = 1.8
@export var health = 10

func _ready():
	pass

func take_damage(amount: int) -> void:
	health -= amount
	print("Damage: ", amount)
	if health <= 0:
		explode()

func explode():
	var parent = get_parent()
	queue_free()
	
	for child in $barrel_small_fractured.get_children():
		if child is MeshInstance3D:
			var frag:fragment = preload("res://fragment.tscn").instantiate()
			frag.init_from_mesh(child)
			frag.collision_layer = fragment_collision_layer
			frag.collision_mask = fragment_collision_mask
			parent.add_child(frag)

			var vel:Vector3 = (frag.global_transform.origin - $ExplodeOrigin.global_transform.origin) * explosion_speed
			frag.linear_velocity = vel

			frag.lifetime = randf_range(min_frag_lifetime, max_frag_lifetime)
