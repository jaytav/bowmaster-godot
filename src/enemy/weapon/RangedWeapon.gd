class_name RangedWeapon
extends EnemyWeapon

var target: Node

onready var _ammo: Ammo = owner.get_node("Stats/Ammo")
onready var _Projectile: PackedScene = load("src/weapons/projectiles/enemy/BasicEnemyProjectile.tscn")


func attack():
	var projectile_instance = _Projectile.instance()
	MainWorld.add(projectile_instance)
	projectile_instance.launch(owner.get_global_position(), target.get_global_position())
	_ammo.shoot()


func can_attack():
	return _ammo.value > 0 and target != null
