extends StaticBody3D

var closed = false
var interactable = true

@export var animation_player: AnimationPlayer

func action_use():
	if interactable == true:
		interactable = false
		closed = !closed
		if closed == false :
			$AnimationPlayer.play("Close_Door")
		if closed == true:
			$AnimationPlayer.play("Open_Door")
		await get_tree().create_timer(1.0, false).timeout
		interactable = true
