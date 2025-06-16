TreeMons:
; entries correspond to TREEMON_SET_* constants
	table_width 2
	dw TreeMonSet_City ; NEW TO CRYSTAL
	dw TreeMonSet_Canyon ; IN GS
	dw TreeMonSet_Town ; NEW TO CRYSTAL
	dw TreeMonSet_Route ; NEW TO CRYSTAL
	dw TreeMonSet_Kanto ; NEW TO CRYSTAL
	dw TreeMonSet_Lake ; NEW TO CRYSTAL
	dw TreeMonSet_Forest ; IN GS
	dw TreeMonSet_Rock ; IN GS
	assert_table_length NUM_TREEMON_SETS
	dw TreeMonSet_City ; unused

; Two tables each (common, rare).
; Structure:
;	db  %, species, level

TreeMonSet_City:
TreeMonSet_Canyon:
; common
	dbbw 50, 10, SPEAROW
	dbbw 15, 10, SPEAROW
	dbbw 15, 10, SPEAROW
	dbbw 10, 10, AIPOM
	dbbw  5, 10, AIPOM
	dbbw  5, 10, AIPOM
	db -1
; rare
	dbbw 50, 10, SPEAROW
	dbbw 15, 10, HERACROSS
	dbbw 15, 10, HERACROSS
	dbbw 10, 10, AIPOM
	dbbw  5, 10, AIPOM
	dbbw  5, 10, AIPOM
	db -1

TreeMonSet_Town: ; NEW TO CRYSTAL
; common
	dbbw 50, 10, SPEAROW
	dbbw 15, 10, EKANS
	dbbw 15, 10, SPEAROW
	dbbw 10, 10, AIPOM
	dbbw  5, 10, AIPOM
	dbbw  5, 10, AIPOM
	db -1
; rare
	dbbw 50, 10, SPEAROW
	dbbw 15, 10, HERACROSS
	dbbw 15, 10, HERACROSS
	dbbw 10, 10, AIPOM
	dbbw  5, 10, AIPOM
	dbbw  5, 10, AIPOM
	db -1

TreeMonSet_Route: ; NEW TO CRYSTAL
; common
	dbbw 50, 10, HOOTHOOT
	dbbw 15, 10, SPINARAK
	dbbw 15, 10, LEDYBA
	dbbw 10, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	db -1
; rare
	dbbw 50, 10, HOOTHOOT
	dbbw 15, 10, PINECO
	dbbw 15, 10, PINECO
	dbbw 10, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	db -1

TreeMonSet_Kanto: ; NEW TO CRYSTAL
; common
	dbbw 50, 10, HOOTHOOT
	dbbw 15, 10, EKANS
	dbbw 15, 10, HOOTHOOT
	dbbw 10, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	db -1
; rare
	dbbw 50, 10, HOOTHOOT
	dbbw 15, 10, PINECO
	dbbw 15, 10, PINECO
	dbbw 10, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	db -1

TreeMonSet_Lake: ; NEW TO CRYSTAL
; common
	dbbw 50, 10, HOOTHOOT
	dbbw 15, 10, VENONAT
	dbbw 15, 10, HOOTHOOT
	dbbw 10, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	db -1
; rare
	dbbw 50, 10, HOOTHOOT
	dbbw 15, 10, PINECO
	dbbw 15, 10, PINECO
	dbbw 10, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	dbbw  5, 10, EXEGGCUTE
	db -1

TreeMonSet_Forest:
; IF DEF(_NITE)
; common
	dbbw 50, 10, CATERPIE ; HOOTHOOT
	dbbw 15, 10, CATERPIE ; 15, PINECO
	dbbw 15, 10, METAPOD ; PINECO
	dbbw 10, 10, EXEGGCUTE ; NOCTOWL
	dbbw  5, 10, EXEGGCUTE ; BUTTERFREE
	dbbw  5, 10, BUTTERFREE ; BEEDRILL
	db -1
; rare
	dbbw 50, 10, CATERPIE ; HOOTHOOT
	dbbw 15, 10, PINECO ; CATERPIE
	dbbw 15, 10, PINECO ; WEEDLE
	dbbw 10, 10, EXEGGCUTE ; HOOTHOOT
	dbbw  5, 10, EXEGGCUTE ; METAPOD
	dbbw  5, 10, BUTTERFREE ; KAKUNA
	db -1

/* ELIF DEF(_DAY)
; common
	dbbw 50, 10, WEEDLE ; HOOTHOOT
	dbbw 15, 10, WEEDLE ; 15, PINECO
	dbbw 15, 10, KAKUNA ; PINECO
	dbbw 10, 10, EXEGGCUTE ; NOCTOWL
	dbbw  5, 10, EXEGGCUTE ; BUTTERFREE
	dbbw  5, 10, BEEDRILL
	db -1
; rare
	dbbw 50, 10, WEEDLE ; HOOTHOOT
	dbbw 15, 10, PINECO ; CATERPIE
	dbbw 15, 10, PINECO ; WEEDLE
	dbbw 10, 10, EXEGGCUTE ; HOOTHOOT
	dbbw  5, 10, EXEGGCUTE ; METAPOD
	dbbw  5, 10, BEEDRILL ; KAKUNA
	db -1
ENDC */

TreeMonSet_Rock:
	dbbw 90, 15, KRABBY
	dbbw 10, 15, SHUCKLE
	db -1
