extends Node
class_name Gatekeeper

static func is_whitelisted(resource_path : String, whitelist : Array):
	return resource_path in whitelist

# packed_scene is the initial untrusted scene.
static func remove_scene_scripts(packed_scene : PackedScene, whitelist : Array) -> PackedScene:
	var scene = packed_scene.duplicate() # I don't know if the duplicates are necessary.
	var bundle = (scene._get_bundled_scene()).duplicate()
	
	for i in range(0,bundle.variants.size()): # for every variable in the scene,
		if (bundle.variants[i] is Script || bundle.variants[i] is PackedScene) && !is_whitelisted(bundle.variants[i].get_path(), whitelist):
			bundle.variants[i] = null

# push the variants back onto the scene
	scene._set_bundled_scene(bundle)
# and return the PackedScene
	return scene
