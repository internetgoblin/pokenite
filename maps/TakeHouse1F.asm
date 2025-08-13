	object_const_def
	const TAKEHOUSE1F_MOM1

TakeHouse1F_MapScripts:
	def_scene_scripts
	scene_script TakeHouse1FNoop1, SCENE_TAKEHOUSE1F_ERRAND
	scene_script TakeHouse1FNoop2, SCENE_TAKEHOUSE1F_NOOP

	def_callbacks

TakeHouse1FNoop1:
	end

TakeHouse1FNoop2:
	end


TakeHouse1FMomErrandRight:
	turnobject TAKEHOUSE1F_MOM1, RIGHT
	applymovement PLAYER, ErrandBlanka1Movement
	sjump TakeHouse1FMomErrandScript

TakeHouse1FMomErrandLeft:
	turnobject TAKEHOUSE1F_MOM1, RIGHT
	turnobject PLAYER, LEFT
TakeHouse1FMomErrandScript:
	opentext
	writenamedtext TakeHouseMrsName, TakeHouse1FMomErrandText1
	promptbutton
	writenamedtext Take1FBlankaName, TakeHouse1FBlankaErrandText1
	promptbutton
	writenamedtext TakeHouseMrsName, TakeHouse1FMomErrandText2
	promptbutton
	writenamedtext Take1FBlankaName, TakeHouse1FBlankaErrandText2
	promptbutton
	writenamedtext TakeHouseMrsName, TakeHouse1FMomErrandText3
	promptbutton
	closetext
	setscene SCENE_TAKEHOUSE1F_NOOP
	end

TakeHouseMrsTake1:
	faceplayer
	checkevent EVENT_GOT_ODD_EGG
	iffalse TakeHouse1FMomReminderScript
	checkevent EVENT_GAVE_BABY_TO_MOM
	iffalse .GiveMomBabyScript

	opentext
	writenamedtext TakeHouseMrsName, TakeHouseMrsTake1Text
	promptbutton
	closetext
	end

.GiveMomBabyScript:
	; Giving Cleffa to Karen dialog here
	takeitem MYSTERY_EGG
	setevent EVENT_GAVE_BABY_TO_MOM
	clearevent EVENT_GOT_CHIKORITA_FROM_ELM
	setmapscene GOLDENROD_CITY, SCENE_GOLDENRODCITY_CAFE_WARP
	end

TakeHouse1FMomReminderScript:
	opentext
	writenamedtext TakeHouseMrsName, TakeHouse1FMomReminderText
	promptbutton
	closetext
	end

TakeHouse1FPokemon:
	opentext
	writenamedtext TakeHouse1FPokemonName, TakeHouse1FPokemonCry
	cry CLEFFA
	promptbutton
	closetext
	end

TakeHouse1FBedroomScript:
	opentext
	writenamedtext Take1FBlankaName, TakeHouse1FBedroomText
	promptbutton
	closetext
	end

TakeHouse1FBookshelfScript:
	jumpstd DifficultBookshelfScript

TakeHouse1FTVScript:
	opentext
	writenamedtext Take1FBlankaName, TakeHouse1FTVText
	promptbutton
	writenamedtext TakeHouseMrsName, TakeHouse1FTVMomText
	promptbutton
	closetext
	end

ErrandBlanka1Movement:
	step LEFT
	step_end

Take1FBlankaName:
	db "BLANKA@"

TakeHouseMrsName:
	db "MOM@"

TakeHouse1FPokemonName:
	db "CLEFFA@"

TakeHouseMrsTake1Text:
	text "Hey kiddo!" ; placeholder
	done

TakeHouse1FPokemonCry:
	text "Beedup!"
	done

TakeHouse1FBedroomText:
	text "The door leading"
	line "to MOM's bedroom."

	para "It's locked."
	done

TakeHouse1FTVText:
	text "What are you"
	line "watching?"
	done

TakeHouse1FTVMomText:
	text "Don't worry"
	line "about it."
	done

TakeHouse1FMomErrandText1:
	text "BLANKA-deer."
	line "I need you to"
	cont "stop by the…"

	para "DAY-CARE and"
	line "pick up my"
	cont "baby."
	done

TakeHouse1FBlankaErrandText1:
	text "Your baby?"

	para "Ohhh… OK…"

	para "Who's the"
	line "father?"
	done

TakeHouse1FMomErrandText2:
	text "Hehehe…"
	line "Very funny."

	para "No, this isn't"
	line "a human child."

	para "The old couple"
	line "running the"
	cont "place…"

	para "allowed me to"
	line "adopt a baby"
	cont "#MON."
	done

TakeHouse1FBlankaErrandText2:
	text "Alright."
	done

TakeHouse1FMomErrandText3:
	text "The DAY-CARE is"
	line "on ROUTE 34 to"
	cont "the south."

	para "Should be the"
	line "first building"
	cont "to the right."
	done

TakeHouse1FMomReminderText:
	text "Chop chop."
	line "My baby is"
	cont "waiting."
	done

TakeHouse1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  0, TAKE_HOUSE_2F, 1
	warp_event  6,  7, GOLDENROD_CITY, 8
	warp_event  7,  7, GOLDENROD_CITY, 8

	def_coord_events
	coord_event  8,  4, SCENE_TAKEHOUSE1F_ERRAND, TakeHouse1FMomErrandLeft
	coord_event  9,  4, SCENE_TAKEHOUSE1F_ERRAND, TakeHouse1FMomErrandRight

	def_bg_events
	bg_event  1,  0, BGEVENT_READ, TakeHouse1FBedroomScript
	bg_event  7,  1, BGEVENT_READ, TakeHouse1FBookshelfScript
	bg_event  6,  1, BGEVENT_READ, TakeHouse1FTVScript

	def_object_events
	object_event  7,  4, SPRITE_KAREN, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TakeHouseMrsTake1, -1
	object_event  6,  4, SPRITE_CLEFFA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, TakeHouse1FPokemon, EVENT_GOT_CHIKORITA_FROM_ELM