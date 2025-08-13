	object_const_def

GoldAcademy_MapScripts:
	def_scene_scripts

	def_callbacks

GoldAcademySign:
	jumptext GoldAcademySignText

GoldAcademySignText:
	text "GOLD ACADEMY"
	done

GoldAcademy_MapEvents:
	db 0, 0 ; filler

	def_warp_events

	def_coord_events

	def_bg_events
	bg_event 16, 10, BGEVENT_READ, GoldAcademySign

	def_object_events