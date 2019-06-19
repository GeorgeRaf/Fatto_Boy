# StartMenu.gd
extends Control

# Function to take specific action when button is pressed, ex. goto the first level
func _on_StartButton_pressed():
	get_tree().change_scene("res://World.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
