extends Node

var cash : int = 5
var owned_upgrades : Array = []


func add_cash(amount : int):
	cash += amount
	# Update display
	

func spend_cash(amount : int):
	if cash >= amount:
		cash -= amount
	# Update display
