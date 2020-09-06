extends ReplenishStat


func shoot(amount: int = 1):
	set_value(value - amount)
