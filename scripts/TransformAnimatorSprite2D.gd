extends Sprite2D
class_name TransformAnimatorSprite2D

enum State { STOPPED, PLAYING, PAUSED }
var state: State = State.STOPPED

@export_range(0.0, 20.0, 0.1, 'or_greater') var bob_speed: float = 2.0
@export_range(0.0, 256.0, 1.0, 'or_greater') var bob_amplitude: float = 6.0
@export var rot_speed: float = 1.2

var _t := 0.0
var _base_y := 0.0

func _ready() -> void:
	_base_y = position.y

func _process(delta: float) -> void:
	if state != State.PLAYING:
		return
	_t += delta
	rotation += rot_speed * delta
	var p := position
	p.y = _base_y + sin(_t * bob_speed * TAU) * bob_amplitude
	position = p

func play() -> void:
	if state == State.STOPPED:
		_t = 0.0
	state = State.PLAYING

func pause() -> void:
	if state == State.PLAYING:
		state = State.PAUSED

func stop() -> void:
	state = State.STOPPED
	rotation = 0.0
	var p := position
	p.y = _base_y
	position = p
