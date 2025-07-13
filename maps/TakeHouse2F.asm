	object_const_def
	const TAKEHOUSE2F_KOTORA

TakeHouse2F_MapScripts:
	def_scene_scripts

	def_callbacks

TakeHouseKotora:
	disappear TAKEHOUSE2F_KOTORA
	setevent EVENT_KOTORA_JOINS_BLANKA
	getmonname STRING_BUFFER_3, RAICHU
	opentext
	writetext PickupKotoraText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke RAICHU, 10
	closetext
	end

PickupKotoraText:
	text "<PLAYER> received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

TakeHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  0, TAKE_HOUSE_1F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  3,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TakeHouseKotora, EVENT_KOTORA_JOINS_BLANKA