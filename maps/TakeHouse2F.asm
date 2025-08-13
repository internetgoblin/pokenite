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
	setscene SCENE_TAKEHOUSE2F_NOOP
	setevent EVENT_GOT_CHIKORITA_FROM_ELM
	sjump TakeHouseKotora

BlankaName:
	db "BLANKA@"

TakeHouseKotora:
	pause 15
	applymovement PLAYER, BlankaOutOfBed
	opentext
	writenamedtext BlankaName, BlankaWakeUpKotora
	promptbutton
	cry KOTORA
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
	step DOWN
	turn_head LEFT
	step_end

BlankaWakeUpKotora:
	text "Come on, KOTORA."
	line "Let's go."
	done

PickupKotoraText:
	text "You received"
	line "@"
	text_ram wStringBuffer3
	text "!"
	done

TakeHouse2FBookScript:
	opentext
	writenamedtext BlankaName, TakeHouse2FBookText
	promptbutton
	closetext
	end

TakeHouse2FDresserScript:
	opentext
	writenamedtext BlankaName, TakeHouse2FDresserText
	promptbutton
	closetext
	end

TakeHouse2FN64Script:
	opentext
	writenamedtext BlankaName, TakeHouse2FN64Text
	promptbutton
	closetext
	end

TakeHouse2FBookshelfScript:
	opentext
	writenamedtext BlankaName, TakeHouse2FBookshelfText
	promptbutton
	closetext
	end

TakeHouse2FBookText:
	text "A book I left" ; placeholder
	line "open."
	done

TakeHouse2FBookshelfText:
	text "My bookshelf." ; placeholder
	done

TakeHouse2FDresserText:
	text "All my clothes," ; placeholder
	line "neatly organized"
	cont "in my dresser."
	done

TakeHouse2FN64Text:
	text "My N64." ; placeholder
	done

TakeHouse2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  0, TAKE_HOUSE_1F, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, TakeHouse2FBookScript
	bg_event  2,  1, BGEVENT_READ, TakeHouse2FDresserScript
	bg_event  3,  2, BGEVENT_READ, TakeHouse2FN64Script
	bg_event  4,  1, BGEVENT_READ, TakeHouse2FBookshelfScript

	def_object_events
	object_event  0,  4, SPRITE_KOTORA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TakeHouseKotora, EVENT_KOTORA_JOINS_BLANKA
