	object_const_def
	const PLAYERSSILVIASHOUSE_COOLTRAINER_F
	const PLAYERSSILVIASHOUSE_POKEFAN_F

SilviasHouse_MapScripts:
	def_scene_scripts

	def_callbacks

SilviaScript:
	jumptextfaceplayer SilviaText
	end

SilviasMomScript:
	jumptextfaceplayer SilviasMomText

SilviasHouseBookshelfScript:
	jumpstd MagazineBookshelfScript

SilviasHouseRadioScript:
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue .NormalRadio
	checkevent EVENT_LISTENED_TO_INITIAL_RADIO
	iftrue .AbbreviatedRadio
	playmusic MUSIC_POKEMON_TALK
	opentext
	writetext SilviasRadioText1
	pause 45
	writetext SilviasRadioText2
	pause 45
	writetext SilviasRadioText3
	pause 45
	musicfadeout MUSIC_NEW_BARK_TOWN, 16
	writetext SilviasRadioText4
	pause 45
	closetext
	setevent EVENT_LISTENED_TO_INITIAL_RADIO
	end
.NormalRadio:
	jumpstd Radio1Script
.AbbreviatedRadio:
	opentext
	writetext SilviasRadioText4
	pause 45
	closetext
	end

SilviaText:
	text "PIKACHU is an"
	line "evolved #MON."

	para "I was amazed by"
	line "PROF.ELM's find-"
	cont "ings."

	para "He's so famous for"
	line "his research on"
	cont "#MON evolution."

	para "…sigh…"

	para "I wish I could be"
	line "a researcher like"
	cont "him…"
	done

SilviasMomText:
	text "My daughter is"
	line "adamant about"

	para "becoming PROF."
	line "ELM's assistant."

	para "She really loves"
	line "#MON!"

	para "But then, so do I!"
	done

SilviasRadioText1:
	text "PROF.OAK'S #MON"
	line "TALK! Please tune"
	cont "in next time!"
	done

SilviasRadioText2:
	text "#MON CHANNEL!"
	done

SilviasRadioText3:
	text "This is DJ MARY,"
	line "your co-host!"
	done

SilviasRadioText4:
	text "#MON!"
	line "#MON CHANNEL…"
	done

SilviasHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, NEW_BARK_TOWN, 3
	warp_event  3,  7, NEW_BARK_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, SilviasHouseBookshelfScript
	bg_event  1,  1, BGEVENT_READ, SilviasHouseBookshelfScript
	bg_event  7,  1, BGEVENT_READ, SilviasHouseRadioScript

	def_object_events
	object_event  2,  3, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilviaScript, -1
	object_event  5,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SilviasMomScript, EVENT_SILVIAS_HOUSE_SILVIA
