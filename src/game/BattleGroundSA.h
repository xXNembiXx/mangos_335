/*
 * Copyright (C) 2005-2011 MaNGOS <http://getmangos.com/>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 */

#ifndef __BATTLEGROUNDSA_H
#define __BATTLEGROUNDSA_H

class BattleGround;

#define BG_SA_GRY_MAX   3
#define BG_SA_GATE_MAX  6
#define BG_SA_MAX_WS	3

const uint32 BG_SA_GateStatus[6] = {3849, 3623, 3620, 3614, 3617, 3638};
const uint32 BG_SA_WorldStatusA[3] = {3630, 3629, 3628};
const uint32 BG_SA_WorldStatusH[3] = {3631, 3627, 3626};
const uint32 BG_IC_TEAM[BG_TEAMS_COUNT] = {84,83};

enum BG_SA_WorldStates
{
    BG_SA_TIMER_MINUTES         = 3559,
    BG_SA_TIMER_10SEC           = 3560,
    BG_SA_TIMER_SEC             = 3561,
    BG_SA_ALLY_ATTACKS          = 4352,
    BG_SA_HORDE_ATTACKS         = 4353,

    BG_SA_PURPLE_GATEWS         = 3614,
    BG_SA_RED_GATEWS            = 3617,
    BG_SA_BLUE_GATEWS           = 3620,
    BG_SA_GREEN_GATEWS          = 3623,
    BG_SA_YELLOW_GATEWS         = 3638,
    BG_SA_ANCIENT_GATEWS        = 3849,


    BG_SA_LEFT_GY_ALLIANCE      = 3635,
    BG_SA_RIGHT_GY_ALLIANCE     = 3636,
    BG_SA_CENTER_GY_ALLIANCE    = 3637,

    BG_SA_RIGHT_ATT_TOKEN_ALL   = 3627,
    BG_SA_LEFT_ATT_TOKEN_ALL    = 3626,

    BG_SA_LEFT_ATT_TOKEN_HRD    = 3629,
    BG_SA_RIGHT_ATT_TOKEN_HRD   = 3628,

    BG_SA_HORDE_DEFENCE_TOKEN   = 3631,
    BG_SA_ALLIANCE_DEFENCE_TOKEN = 3630,

    BG_SA_RIGHT_GY_HORDE        = 3632,
    BG_SA_LEFT_GY_HORDE         = 3633,
    BG_SA_CENTER_GY_HORDE       = 3634,

    BG_SA_BONUS_TIMER           = 0xdf3,
    BG_SA_ENABLE_TIMER          = 3564,
};

static int32 GrraveYardWS[3][2]=
{
    {3636, 3632},
    {3635, 3633},
    {3637, 3634},
};

enum BG_SA_Sounds
{
    BG_SA_SOUND_GYD_CLAIMED            = 8192,
    BG_SA_SOUND_GYD_CAPTURED_ALLIANCE  = 8173,
    BG_SA_SOUND_GYD_CAPTURED_HORDE     = 8213,
    BG_SA_SOUND_GYD_ASSAULTED_ALLIANCE = 8212,
    BG_SA_SOUND_GYD_ASSAULTED_HORDE    = 8174,
    BG_SA_SOUND_GYD_VICTORY            = 8456
};

enum BG_SA_GraveYardStatus
{
    BG_SA_GARVE_TYPE_CONTESTED           = 1,
    BG_SA_GARVE_STATUS_ALLY_CONTESTED    = 1,
    BG_SA_GARVE_STATUS_HORDE_CONTESTED   = 2,
	BG_SA_GARVE_TYPE_OCCUPIED            = 3,
    BG_SA_GARVE_STATUS_ALLY_OCCUPIED     = 3,
    BG_SA_GARVE_STATUS_HORDE_OCCUPIED    = 4
};

// WorldSafeLocs ids for 5 gyd, and for ally, and horde starting location
const uint32 BG_SA_GraveyardIdsPhase[3] = {1347, 1346, 1348};
const uint32 BG_SA_GraveyardIds[2] = {1349, 1350};

enum BG_SA_GraveYard
{
    BG_SA_GARVE_E                       = 0,
    BG_SA_GARVE_W                       = 1,
    BG_SA_GARVE_S                       = 2,
    BG_SA_GARVE_ERROR                   = 255
};

enum BG_SA_Timers
{
    BG_SA_FLAG_CAPTURING_TIME           = 60000,
    BG_SA_ROUNDLENGTH                   = 600000,
    BG_SA_BOAT_START                    = 60000
};

enum BG_SA_GateStatus
{
    BG_SA_GO_GATES_NORMAL               = 1,
    BG_SA_GO_GATES_DAMAGE               = 2,
    BG_SA_GO_GATES_DESTROY              = 3
};

enum BG_SA_TeamIndex
{
    BG_SA_ALLIANCE                      = 0,
    BG_SA_HORDE                         = 1
};

enum BG_SA_GoId
{
    BG_SA_GO_GATES_ROOM_ANCIENT_SHRINE  = 192549,
    BG_SA_GO_GATES_GREEN_EMERALD        = 190722,
    BG_SA_GO_GATES_BLUE_SAPHIRE         = 190724,
    BG_SA_GO_GATES_MAUVE_AMETHYST       = 190723,
    BG_SA_GO_GATES_RED_SUN              = 190726,
    BG_SA_GO_GATES_YELLOW_MOON          = 190727,
    BG_SA_GO_TITAN_RELIC                = 192829
};

enum BG_SA_GoType
{
    BG_SA_GO_GATES_T_ROOM_ANCIENT_SHRINE    = 0,
    BG_SA_GO_GATES_T_GREEN_EMERALD          = 1,
    BG_SA_GO_GATES_T_BLUE_SAPHIRE           = 2,
    BG_SA_GO_GATES_T_MAUVE_AMETHYST         = 3,
    BG_SA_GO_GATES_T_RED_SUN                = 4,
    BG_SA_GO_GATES_T_YELLOW_MOON            = 5
};

enum BG_SA_Events
{
    SA_EVENT_ADD_SPIR       = 5,
    SA_EVENT_ADD_BOMB       = 6,
    SA_EVENT_ADD_NPC        = 7,
    SA_EVENT_ADD_GO         = 8,
    SA_EVENT_ADD_VECH_E     = 9,
    SA_EVENT_ADD_VECH_W     = 10,
    SA_EVENT_OP_DOOR        = 254
};

enum BG_SA_Boats
{
    BG_SA_BOAT_ONE,
    BG_SA_BOAT_TWO,
    BG_SA_MAXOBJ = 2
};

struct BG_SA_BannerTimer
{
    uint32      timer;
    uint8       type;
    uint8       teamIndex;
};

enum BG_SA_MessageType
{
    BG_SA_ATTACK            = 0,
    BG_SA_DAMAGE            = 1,
    BG_SA_DESTROY           = 2
};

enum BG_SA_type_gyd_attack
{
    STATUS_CLAIMED          = 0,
    STATUS_CONQUESTED       = 1
};

enum VehicleFactions
{
    VEHICLE_FACTION_NEUTRAL  = 35,
    VEHICLE_FACTION_ALLIANCE = 3,
    VEHICLE_FACTION_HORDE    = 6
};

/* Ships:
 * 193182 - ally
 * 193183 - horde
 * 193184 - horde
 * 193185 - ally
 */
enum BG_SA_Boat
{
    BG_SA_BOAT_ONE_A = 193182,
    BG_SA_BOAT_TWO_H = 193183,
    BG_SA_BOAT_ONE_H = 193184,
    BG_SA_BOAT_TWO_A = 193185
};

enum VehicleTypes
{
    VEHICLE_UNK           = 0,
    VEHICLE_SA_DEMOLISHER = 1,
    VEHICLE_SA_CANNON     = 2
};

static float BG_SA_START_LOCATIONS[7][4] = {
    {1804.10f, -168.46f, 60.55f, 2.65f},  // Pillar 1 - don't used now
    {1803.71f, 118.61f, 59.83f, 3.56f},   // Pillar 2 - don't used now
    {1597.64f, -106.35f, 8.89f, 4.13f},   // Dock 1
    {1606.61f, 50.13f, 7.58f, 2.39f},     // Dock 2
    {1209.70f, -65.16f, 70.10f, 0.00f},   // Defenders start loc
    //Ships
    { 2679.696777f, -826.891235f, 3.712860f, 5.78367f}, //rot2 1 rot3 0.0002f
    { 2574.003662f, 981.261475f, 2.603424f, 0.807696f}
};

enum BG_SA_Phase
{
    SA_ROUND_ONE = 1,
    SA_ROUND_TWO = 2,
};

struct BG_SA_RoundScore
{
    Team winner;
    uint32 time;
};

class BattleGroundSAScore : public BattleGroundScore
{
    public:
        BattleGroundSAScore(): DemolishersDestroyed(0), GatesDestroyed(0) {};
        virtual ~BattleGroundSAScore() {};
        uint32 DemolishersDestroyed;
        uint32 GatesDestroyed;
};

class BattleGroundSA : public BattleGround
{
    friend class BattleGroundMgr;

    public:
        BattleGroundSA();
        ~BattleGroundSA();
        void Update(uint32 diff);

        /* inherited from BattlegroundClass */
        virtual void AddPlayer(Player *plr);
        virtual void StartingEventCloseDoors();
        virtual void StartingEventOpenDoors();
        virtual void EventPlayerDamageGO(Player *player, GameObject* target_obj, uint32 eventId);
        virtual void EventSpawnGOSA(Player *owner, Creature* obj, float x, float y, float z);
        virtual void FillInitialWorldStates(WorldPacket& data, uint32& count);
        virtual void EventPlayerClickedOnFlag(Player *source, GameObject* target_obj);
        virtual void HandleKillUnit(Creature* unit, Player* killer);
        virtual WorldSafeLocsEntry const* GetClosestGraveYard(Player* player);
        virtual void Reset();

        Team GetDefender() const	{ return defender; }
		uint8 GetGydController(uint8 gyd) const { return m_Gyd[gyd]; }
		uint32 GetVehicleFaction(uint8 vehicleType) const { return GetCorrectFactionSA(vehicleType); }
        void RemovePlayer(Player *plr, ObjectGuid guid);
        void HandleAreaTrigger(Player *Source, uint32 Trigger);
        void EndBattleGround(Team winner);
        void ResetBattle(uint32 winner, Team teamDefending);
        bool SetupBattleGround();
        void SendMessageSA(Player *player, uint32 type, uint32 name);
        void UpdateTimer();
        void UpdatePhase();
        uint32 Phase;
        Team defender;
        uint32 Round_timer;
        uint32 TimeST2Round;
        bool shipsStarted;
		bool relicGateDestroyed;
        uint32 shipsTimer;
		bool isDemolisherDestroyed[2];
        /* Scorekeeping */
        void UpdatePlayerScore(Player *Source, uint32 type, uint32 value);
        /* For boats */
        bool SetupShips();
        void StartShips();
        // Send packet to player for create boats (client part)
        void SendTransportInit(Player *player);
        // Send packet to player for destroy boats (client part)
        void SendTransportsRemove(Player * player);
        /* For SendWarningToAll */
        void SendWarningToAllSA(uint8 gyd, int status, Team team, bool isDoor = false, int door = NULL, bool destroyed = false);
        /* For vehicle's faction*/
        uint32 GetCorrectFactionSA(uint8 vehicleType) const;
		/* This teleports player to correct loc in function of BG status and it resurects player if necesary */
        void TeleportPlayerToCorrectLoc(Player *player, bool resetBattle = false);

    private:
        uint8               m_Gyd[BG_SA_GRY_MAX];
        uint8               m_prevGyd[BG_SA_GRY_MAX];   // used for performant wordlstate-updating
        uint32              m_GydTimers[BG_SA_GRY_MAX];
		BG_SA_RoundScore RoundScores[2];
		/* Gameobject spawning/despawning */
        void _CreateBanner(uint8 node, uint8 type, uint8 teamIndex, bool delay);
        BG_SA_BannerTimer   m_BannerTimers[BG_SA_GRY_MAX];
        int32 _GatesName(GameObject* obj);
        int32 _GydName(uint8 gyd);
        int32 GateStatus[BG_SA_GATE_MAX];
        bool TimerEnabled;
        void _GydOccupied(uint8 node,Team team);
        void ToggleTimer();
        void ResetWorldStates();
};
#endif
