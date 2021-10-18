extends KinematicBody2D

var knockback = Vector2.ZERO

onready var stats = $Stats
onready var animatedSprite = $AnimatedSprite

func _ready():
	start_frame()

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, 200 * delta)
	knockback = move_and_slide(knockback)

func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 120

func _on_Stats_no_health():
	queue_free()

func start_frame():
	var spriteFrames = animatedSprite.get_sprite_frames()
	var spriteCount = spriteFrames.get_frame_count(animatedSprite.animation) - 1
	animatedSprite.frame = rand_range(0, spriteCount)
