class_name ShopItem
extends Resource

@export var name: String = "Item_Name"
@export var value: int = 1
@export_multiline var description: String = ""
@export var icon: Texture2D

enum EffectType { ADD_PIECE, UPGRADE_PIECE, FATE_CARD, CELL_MODIFIER, TOMB}
@export var effect: EffectType
@export var effect_value: Variant
