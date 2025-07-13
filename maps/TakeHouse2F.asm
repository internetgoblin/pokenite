	object_const_def
	const TAKEHOUSE2F_KOTORA

TakeHouse2F_MapScripts:
	def_scene_scripts
	scene_script TakeHouse2FIntroScene, SCENE_TAKEHOUSE2F_INTRO
	scene_script TakeHouse2FNoopScene, SCENE_TAKEHOUSE2F_NOOP

	def_callbacks
	callback MAPCALLBACK_NEWMAP, TakeHouse2FInitializeRoomCallback

TakeHouse2FIntroScene:
	sdefer TakeHouse2FIntroScript
	end

TakeHouse2FNoopScene:
	end

TakeHouse2FInitializeRoomCallback:
	special ToggleDecorationsVisibility
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	checkevent EVENT_INITIALIZED_EVENTS
	iftrue .SkipInitialization
	jumpstd InitializeEventsScript
	endcallback

.SkipInitialization:
	endcallback

TakeHouse2FIntroScript:
	applymovement PLAYER, BlankaOutOfBed
	setscene SCENE_TAKEHOUSE2F_NOOP
	end

BlankaName:
	db "BLANKA@"

TakeHouseKotora:
	opentext
	writenamedtext BlankaName, BlankaWakeUpKotora
	promptbutton
	closetext
	disappear TAKEHOUSE2F_KOTORA
	setevent EVENT_KOTORA_JOINS_BLANKA
	getmonname STRING_BUFFER_3, KOTORA
	opentext
	writetext PickupKotoraText
	playsound SFX_CAUGHT_MON
	waitsfx
	promptbutton
	givepoke KOTORA, 10
	closetext
	end

BlankaOutOfBed:
	step_end

BlankaWakeUpKotora:
	text "Come on, KOTORA."
	line "Let's go."
	done

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
	object_event  3,  2, SPRITE_KOTORA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TakeHouseKotora, EVENT_KOTORA_JOINS_BLANKA