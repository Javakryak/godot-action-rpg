extends Camera2D

onready var topLeftLimit = $Limits/TopLeft
onready var bottomRightLimit = $Limits/BottomRight

func _ready():
	limit_top = topLeftLimit.position.y
	limit_left = topLeftLimit.position.x
	limit_bottom = bottomRightLimit.position.y
	limit_right = bottomRightLimit.position.x
