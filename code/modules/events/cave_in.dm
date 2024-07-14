/datum/round_event_control/cave_in
	name = "Cave-In: Minor"
	typepath = /datum/round_event/cave_in
	weight = 10
	max_occurrences = 5
	earliest_start = 10 MINUTES
	category = EVENT_CATEGORY_ENGINEERING
	description = "A single cave-in occurs in the station."
	map_flags = EVENT_PLANETARY_ONLY

/datum/round_event_control/cave_in/can_spawn_event(players_amt, allow_magic)
	. = ..()
	if(!.)
		return .

	if(!length(GLOB.generic_event_spawns))
		return FALSE

/datum/round_event/cave_in
	start_when = 1
	announce_when = 3
	end_when = 6
	///The chosen location and center of our cave-in.
	var/turf/epicenter
	///A list of turfs that will be damaged by this event.
	var/list/turfs_to_crush

/datum/round_event/cave_in/setup()
	epicenter = get_turf(pick(GLOB.generic_event_spawns))
	if(!epicenter)
		message_admins("Cave-in event failed to find a turf! generic_event_spawn landmarks may be absent or bugged. Aborting...")
		return

	// Give a bit of variance so our epicenter isn't always on the landmark.
	epicenter = locate(epicenter.x + rand(-4, 4), epicenter.y + rand(-4, 4), epicenter.z)

	message_admins("An cave-in is about to strike the [get_area_name(epicenter)][ADMIN_JMP(epicenter)].")

	var/turf/collapse_point_high = locate(epicenter.x + rand(2, 6), epicenter.y + rand(2, 6), epicenter.z)
	var/turf/collapse_point_low = locate(epicenter.x - rand(2, 6), epicenter.y - rand(2, 6), epicenter.z)

	turfs_to_crush = block(collapse_point_high, collapse_point_low)

	for(var/turf/turf_to_check in turfs_to_crush)
		var/nearest_distance = get_dist(turf_to_check, epicenter)
		if(nearest_distance > 2)
			if(prob(50))
				turfs_to_crush -= turf_to_check





/datum/round_event/cave_in/announce(fake)
	var/alert = pick("Seismic sensors indicate unplanned roof fall near [get_area_name(epicenter)].",
	"Seismic sensors report seismic activity of unknown severity near [station_name()].",
	"Mining operations are conducting planned detonation near [station_name()]. This may trigger collapse in station structure.",
	)

	priority_announce(alert, "Seismic Report")

/datum/round_event/cave_in/start()
	notify_ghosts(
		"The cave-in's epicenter has been located: [get_area_name(epicenter)]!",
		source = epicenter,
		header = "Rumble Rumble Rumble!",
	)

/datum/round_event/cave_in/tick()
	if(ISMULTIPLE(activeFor, 2))
		for(var/turf/turf_to_crush in turfs_to_crush)
			if(prob(50))
				new /obj/effect/temp_visual/mook_dust(turf_to_crush)

	if(activeFor == end_when - world.tick_lag)
		playsound(epicenter, 'sound/misc/metal_creak.ogg', 125, TRUE)
		for(var/turf/turf_to_crush in turfs_to_crush)
			SSexplosions.medturf += turf_to_crush

/datum/round_event/cave_in/end()
	playsound(epicenter, 'sound/misc/earth_rumble.ogg', 125)

	for(var/turf/turf_to_crush in turfs_to_crush)
		turf_to_crush.place_on_top(/turf/closed/mineral/random/low_chance)
