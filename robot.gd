@tool
class_name RobotType extends Node3D

@export var movementDuration: float = 1.0
@export var expression: RobotExpression :
	set(newExpression):
		if not newExpression.changed.is_connected(handleExpressionChanged):
			newExpression.changed.connect(handleExpressionChanged.bind(newExpression))
		expression = newExpression
		handleExpressionChanged(newExpression)


@onready var RightArm: MeshInstance3D = $"model/RightArm"
@onready var LeftArm: MeshInstance3D = $"model/LeftArm"
@onready var Head: MeshInstance3D = $"model/Cube"

@onready var EyesSprite: AnimatedSprite3D = $"model/Cube/FaceMesh/EyesSprite"
@onready var BrowsSprite: AnimatedSprite3D = $"model/Cube/FaceMesh/BrowsSprite"
@onready var MouthSprite: AnimatedSprite3D = $"model/Cube/FaceMesh/MouthSprite"
@onready var ExtrasSprite: AnimatedSprite3D = $"model/Cube/FaceMesh/ExtrasSprite"


func handleExpressionChanged(newExpression: RobotExpression):
	if LeftArm: animateRotation("x", LeftArm, newExpression.leftArmRotation)
	if RightArm: animateRotation("x", RightArm, newExpression.rightArmRotation)
	if Head: 
		animateRotation("all", Head, Vector3(
			newExpression.headXRotation, 
			newExpression.headYRotation, 
			newExpression.headZRotation
		))
	if EyesSprite: changeCues(EyesSprite, newExpression.eyes)
	if BrowsSprite: changeCues(BrowsSprite, newExpression.brows)
	if MouthSprite: changeCues(MouthSprite, newExpression.mouth)
	if ExtrasSprite: changeCues(ExtrasSprite, newExpression.extras)


func animateRotation(axis, mesh, targetRotation):
	var tween = create_tween()
	var newRotation = Vector3(mesh.rotation_degrees)
	if axis == "all": 
		newRotation = targetRotation
	else:
		newRotation[axis] = targetRotation
	tween.tween_property(mesh, "rotation_degrees", newRotation, movementDuration)


func changeCues(sprite: AnimatedSprite3D, newExpression: StringName):
	if sprite.animation == newExpression: return
	sprite.play_backwards(sprite.animation)
	await sprite.animation_finished
	sprite.animation = newExpression
	sprite.play(sprite.animation)
	await sprite.animation_finished
