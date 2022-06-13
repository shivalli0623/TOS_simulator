extends Area2D

# texture pre-load
var blue_gem = preload("res://myAsset/Texture2D/gems/normalGems/bule.png")
var dark_gem = preload("res://myAsset/Texture2D/gems/normalGems/dark.png")
var green_gem = preload("res://myAsset/Texture2D/gems/normalGems/green.png")
var pink_gem = preload("res://myAsset/Texture2D/gems/normalGems/pink.png")
var red_gem = preload("res://myAsset/Texture2D/gems/normalGems/red.png")
var yellow_gem = preload("res://myAsset/Texture2D/gems/normalGems/yellow.png")
# texture list
var GEM_TYPE = [blue_gem, dark_gem, green_gem, pink_gem, red_gem, yellow_gem]

var selected = false
var fixed_position = null


func send_argument(kwarg: Dictionary):
	var gem_type = kwarg["gem_type"]
	
func _ready():
	# random texture
	randomize()
	# randi(): Generates a pseudo-random 32-bit unsigned integer between 0 and 4294967295 (inclusive)
	# [ 4294967295 % 6 = 3 ] mean 0, 1, 2, 3 are redundant
	# the range is 0 ~ (4294967295 - 4)
	$Sprite.texture = GEM_TYPE[(randi() - 4) % 6]
	fixed_position = position

func _physics_process(delta):
	if selected:
		global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)

func position_exchange():
	pass

# signal
func _on_Gem_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.is_pressed():
			selected = true
		else:
			selected = false