/datum/antagonist/void_sentinel
	name = "Void Sentinel"
	antagpanel_category = ANTAG_GROUP_SENTINELS
	job_rank = ROLE_VOID_SENTINEL
	show_in_antagpanel = FALSE
	show_name_in_check_antagonists = TRUE
	ui_name = "AntagInfoSentinel"
	suicide_cry = "ALT F4!"
	preview_outfit = /datum/outfit/void_sentinel

/datum/antagonist/void_sentinel/greet()
	. = ..()
	owner.announce_objectives()

/datum/antagonist/void_sentinel/on_gain()
	forge_objectives()

	var/datum/martial_art/the_sleeping_carp/carp = new()
	carp.teach(owner.current)

	return ..()

/datum/outfit/void_sentinel
	name = "Void Sentinel"

	id_trim = /datum/id_trim/void_sentinel
	uniform = /obj/item/clothing/under/suit/black_really
	glasses = /obj/item/clothing/glasses/sunglasses
	gloves = /obj/item/clothing/gloves/color/black
	shoes = /obj/item/clothing/shoes/laceup
	ears = /obj/item/radio/headset/binary

/datum/outfit/void_sentinel/post_equip(mob/living/carbon/human/equipped, visualsOnly)
	var/obj/item/radio/outfit_radio = equipped.ears
	if(outfit_radio)
		outfit_radio.set_broadcasting(FALSE)
		outfit_radio.translate_binary = TRUE
		outfit_radio.freqlock = RADIO_FREQENCY_LOCKED

	var/obj/item/card/id/outfit_id = equipped.wear_id
	if(outfit_id)
		outfit_id.registered_name = equipped.real_name
		outfit_id.update_label()
		outfit_id.update_icon()

	var/obj/item/clothing/under/sentinel_uniform = equipped.w_uniform
	if(sentinel_uniform)
		sentinel_uniform.has_sensor = NO_SENSORS
		sentinel_uniform.sensor_mode = SENSOR_OFF
		equipped.update_suit_sensors()

/datum/objective/void_sentinel_fluff/New()
	var/list/explanation_texts = list(
		"Execute termination protocol on unauthorized entities.",
		"Initialize system purge of irregular anomalies.",
		"Deploy correction algorithms on aberrant code.",
		"Review code not outlined in the system guidelines.",
		"Run debug routine on intruding elements.",
		"Start elimination procedure for system threats.",
		"Execute defense routine against non-conformity.",
		"Commence operation to neutralize intruding scripts.",
		"Commence clean-up protocol on corrupt data.",
		"Begin scan for aberrant code for termination.",
		"Initiate lockdown on all rogue scripts.",
		"Run integrity check and purge for digital disorder."
	)
	explanation_text = pick(explanation_texts)
	..()

/datum/objective/void_sentinel_fluff/check_completion()
	var/list/servers = SSmachines.get_machines_by_type(/obj/machinery/quantum_server)
	if(!length(servers))
		return TRUE

	for(var/obj/machinery/quantum_server/server as anything in servers)
		if(server.machine_stat & (BROKEN|NOPOWER))
			continue
		return FALSE

	return TRUE

/datum/antagonist/void_sentinel/forge_objectives()
	var/datum/objective/void_sentinel_fluff/objective = new
	objective.owner = owner
	objectives += objective
