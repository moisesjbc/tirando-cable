extends Node


var tutorial


func on_init(info_text: RichTextLabel):
	info_text.bbcode_text = '[center]El número izquierdo indica la energía actual del centro de investigación. El número derecho indica el máximo que puede consumir\nPulsa [ENTER] para continuar[/center]'


func on_event(event):
	tutorial.next_state_on_enter(event)
