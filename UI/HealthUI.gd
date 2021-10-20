extends Control

var hearts = 4 setget set_hearts
var max_hearts = 4 setget set_max_hearts

onready var heartUIFull = $HeartUIFull
onready var heartUIEmpty = $HeartUIEmpty

func set_hearts(value):
	hearts = value
	if heartUIFull != null:
		heartUIFull.rect_size.x = hearts * heartUIFull.texture.get_width()


func set_max_hearts(value):
	max_hearts = value
	if heartUIEmpty != null:
		heartUIEmpty.rect_size.x = max_hearts * heartUIEmpty.texture.get_width()


func _ready():
	self.max_hearts = PlayerStats.max_health
	self.hearts = PlayerStats.health
	PlayerStats.connect("health_changed", self, "set_hearts")
	PlayerStats.connect("max_health_changed", self, "set_max_hearts")
