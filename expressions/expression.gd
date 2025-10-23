@tool
class_name RobotExpression extends Resource


@export_group("Arms")
@export_range(-120, 190, 1) var leftArmRotation = 0 :
	set(new):
		leftArmRotation = new
		emit_changed()
@export_range(-120, 190, 1) var rightArmRotation = 0 :
	set(new): 
		rightArmRotation = new
		emit_changed()

@export_group("Head")
@export_range(-40, 50, 1) var headXRotation = 0 :
	set(new): 
		headXRotation = new
		emit_changed()
@export_range(-85, 85, 1) var headYRotation = 0 :
	set(new): 
		headYRotation = new
		emit_changed()
@export_range(-50, 50, 1) var headZRotation = 0 :
	set(new): 
		headZRotation = new
		emit_changed()


@export_group("Face")
@export_enum("default", "squint") var eyes: String = "default" :
	set(new): 
		eyes = new
		emit_changed()
