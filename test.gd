extends Node3D

const MICRO_ON = 0.5
const MICRO_OFF = 1.0

@export var expressions: Array[RobotExpression] = []
@export var defaultExpression: RobotExpression

@onready var Robot: RobotType = $Robot
@onready var TotalTimer: Timer = $TotalTimer
@onready var MicroexpressionTimer: Timer = $MicroexpressionTimer
@onready var MessagePanel: Label3D = %FinalLabel

var clickCount = 0
var expressionCounter = 0
var currentExpression: RobotExpression
var expressionShowing: bool = false

func _on_button_pressed(name: String):
	if name == "trigger_click" and TotalTimer.is_stopped():
		clickCount += 1
		if clickCount == 2:
			clickCount = 0
			show_expression()

func show_expression():
	currentExpression = expressions[expressionCounter]
	MessagePanel.visible = false
	# Print debug info
	print("\nShowing emotion:")
	print("   Eyes: ", currentExpression.eyes)
	print("   Brows: ", currentExpression.brows)
	print("   Mouth: ", currentExpression.mouth)
	# Set expression
	TotalTimer.start(10.0)
	expressionShowing = false
	MicroexpressionTimer.start(MICRO_OFF)
	Robot.expression = defaultExpression

func _on_microexpression_done():
	if expressionShowing:
		expressionShowing = false
		MicroexpressionTimer.start(MICRO_OFF)
		Robot.expression = defaultExpression
	else:
		expressionShowing = true
		MicroexpressionTimer.start(MICRO_ON)
		Robot.expression = currentExpression

func _on_expression_done():
	MicroexpressionTimer.stop()
	expressionCounter += 1
	MessagePanel.visible = true

################## VR PART ##################
var xr_interface: XRInterface

func _ready():
	xr_interface = XRServer.find_interface("OpenXR")
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR initialized successfully")

		# Turn off v-sync!
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)

		# Change our main viewport to output to the HMD
		get_viewport().use_xr = true
		
		# Randomize the expression order
		MessagePanel.visible = false
		expressions.shuffle()
	else:
		print("OpenXR not initialized, please check if your headset is connected")
