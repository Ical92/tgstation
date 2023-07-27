/datum/species/bovine
	name = "\improper Bovine"
	id = SPECIES_BOVINE
	mutant_bodyparts = list("wings" = "None")
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	payday_modifier = 1
	exotic_blood = /datum/reagent/consumable/milk
	exotic_bloodtype = "M"
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/bovine,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/bovine,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/bovine,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/bovine,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/bovine,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/bovine,
	)

/datum/species/bovine/get_scream_sound(mob/living/carbon/human/human)
	if(human.gender == MALE)
		if(prob(1))
			return 'sound/voice/human/wilhelm_scream.ogg'
		return pick(
			'sound/voice/human/malescream_1.ogg',
			'sound/voice/human/malescream_2.ogg',
			'sound/voice/human/malescream_3.ogg',
			'sound/voice/human/malescream_4.ogg',
			'sound/voice/human/malescream_5.ogg',
			'sound/voice/human/malescream_6.ogg',
		)

	return pick(
		'sound/voice/human/femalescream_1.ogg',
		'sound/voice/human/femalescream_2.ogg',
		'sound/voice/human/femalescream_3.ogg',
		'sound/voice/human/femalescream_4.ogg',
		'sound/voice/human/femalescream_5.ogg',
	)

/datum/species/bovine/get_species_description()
	return "You are a hummman, always have been, always will be, and any claimmms to the contrary are mmmoooonstrous lies"
