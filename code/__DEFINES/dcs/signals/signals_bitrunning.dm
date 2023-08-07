/// from /obj/structure/netchair/enter_matrix() : (datum/weakref/mind_ref)
#define COMSIG_BITRUNNER_CLIENT_CONNECTED "bitrunner_connected"

/// from /obj/structure/netchair/disconnect_occupant() : (datum/weakref/mind_ref)
#define COMSIG_BITRUNNER_CLIENT_DISCONNECTED "bitrunner_disconnected"

/// from /obj/machinery/netpod/default_pry_open() : (mob/living/intruder)
#define COMSIG_BITRUNNER_CROWBAR_ALERT "bitrunner_crowbar"

/// from /obj/effect/spawner/bitrunner_loot() : (points)
#define COMSIG_BITRUNNER_GOAL_POINT "bitrunner_goal_point"

/// from /obj/machinery/quantum_server/on_exit_turf_entered(): (atom/entered)
#define COMSIG_BITRUNNER_DOMAIN_COMPLETE "bitrunner_complete"

/// from /obj/machinery/netpod/on_take_damage()
#define COMSIG_BITRUNNER_NETPOD_INTEGRITY "bitrunner_netpod_damage"

/// from /obj/structure/hololadder and complete alert
#define COMSIG_BITRUNNER_SAFE_DISCONNECT "bitrunner_disconnect"

/// from /obj/machinery/netpod/open_machine(), /obj/machinery/quantum_server, etc (obj/machinery/netpod)
#define COMSIG_BITRUNNER_SEVER_AVATAR "bitrunner_sever"

/// from /obj/machinery/quantum_server/shutdown() : (mob/living)
#define COMSIG_BITRUNNER_SHUTDOWN_ALERT "bitrunner_shutdown"

/// from /datum/antagonist/cyber_police/proc/notify() :
#define COMSIG_BITRUNNER_THREAT_CREATED "bitrunner_threat"

/// from midround and event spawns: (mob/living)
#define COMSIG_BITRUNNER_COP_SPAWNED "bitrunner_cop_spawned"

/// from /obj/machinery/quantum_server/refreshParts(): (servo rating)
#define COMSIG_BITRUNNER_SERVER_UPGRADED "bitrunner_server_upgraded"
