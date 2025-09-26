extends Sprite2D
class_name ExtendedSprite2D

# --- Feature 1: motion + screen wrap ---
@export var velocity: Vector2 = Vector2(80, 0)
@export var wrap_enabled: bool = true
@export var wrap_margin: float = 16.0

# --- Feature 2: color pulse ---
@export var pulse_enabled: bool = true
@export var base_color: Color = Color(1, 1, 1, 1)
@export_range(0.0, 20.0, 0.1, 'or_greater') var pulse_speed: float = 2.0
@export_range(0.0, 1.0, 0.01) var pulse_strength: float = 0.4

signal screen_wrapped(new_position: Vector2)
signal pulse_peak

var _t := 0.0

func _ready() -> void:
	modulate = base_color

func _process(delta: float) -> void:
	# --- motion + wrap ---
	position += velocity * delta
	if wrap_enabled:
		var vr: Rect2 = get_viewport().get_visible_rect()
		var p := position
		var wrapped := false
		if p.x < -wrap_margin:
			p.x = vr.size.x + wrap_margin; wrapped = true
		elif p.x > vr.size.x + wrap_margin:
			p.x = -wrap_margin; wrapped = true
		if p.y < -wrap_margin:
			p.y = vr.size.y + wrap_margin; wrapped = true
		elif p.y > vr.size.y + wrap_margin:
			p.y = -wrap_margin; wrapped = true
		if wrapped:
			position = p
			screen_wrapped.emit(p)

	# --- pulse ---
	if pulse_enabled:
		_t += delta * pulse_speed
		var phase := sin(_t * TAU)
		var k: float = lerp(1.0 - pulse_strength, 1.0 + pulse_strength, (phase + 1.0) * 0.5)

		modulate = base_color * k
		if phase > 0.995:
			pulse_peak.emit()
	else:
		modulate = base_color

# Method to be triggered by another node's signal
func boost() -> void:
	var max_speed := 900.0
	var v := velocity * 1.5
	if v.length() > max_speed:
		v = v.normalized() * max_speed
	velocity = v
