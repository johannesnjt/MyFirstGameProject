class_name Hitbox
extends Area3D

@export var damage := 5

func _init() -> void:
	collision_layer = 2 # The value of hitbox's collision layer (in inspektör)
	collision_mask = 0 # 0 = turns off all the masks
