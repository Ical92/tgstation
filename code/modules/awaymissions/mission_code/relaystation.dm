// Areas

/area/awaymission/relaystation/outdoors
	area_flags = UNIQUE_AREA|NOTELEPORT|HIDDEN_AREA
	icon_state = "awaycontent1"
	always_unpowered = TRUE
	outdoors = TRUE
/area/awaymission/relaystation/outdoors/jungle
	icon_state = "awaycontent2"
	map_generator = /datum/map_generator/jungle_generator

// Broken Comms Dish

/datum/looping_sound/relaysignal
	mid_sounds = list(
		'sound/misc/relaysignal.ogg' = 1,
	)
	mid_length = 7.7 SECONDS
	pressure_affected = FALSE

/obj/structure/fluff/relay_dish
	name = "communications dish"
	desc = "A broken communications dish, an odd tone is quietly emanating from it."
	icon = 'icons/obj/exploration.dmi'
	icon_state = "scanner_off"
	var/datum/looping_sound/relaysignal/soundloop

/obj/structure/fluff/relay_dish/Initialize(mapload)
	. = ..()
	soundloop = new(src, TRUE)

// Misc fluff

/obj/structure/fluff/tire_tracks // Glorified varedit of /obj/effect/decal/cleanable/blood/tracks that doesn't track blood
	name = "tire tracks"
	desc = "They look like tracks left by wheels."
	icon = 'icons/effects/blood.dmi'
	icon_state = "tracks"
	color = "#000000"
	alpha = 100
