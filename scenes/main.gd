extends Node


func _ready() -> void:
	SceneManager.load_scene.connect(
		func(scene:PackedScene)->void:
			for i:int in range($Game.get_child_count()):
				await $Game.get_children()[i].queue_free()
			$Game.add_child(scene.instantiate())
	)
