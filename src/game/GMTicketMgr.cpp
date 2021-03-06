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

#include "Common.h"
#include "Database/DatabaseEnv.h"
#include "SQLStorages.h"
#include "GMTicketMgr.h"
#include "ObjectMgr.h"
#include "ObjectGuid.h"
#include "ProgressBar.h"
#include "Policies/SingletonImp.h"
#include "Player.h"

INSTANTIATE_SINGLETON_1(GMTicketMgr);

void GMTicketMgr::LoadGMTickets()
{
    m_GMTicketMap.clear();                                  // For reload case

    QueryResult *result = CharacterDatabase.Query(
        //      0          1     2            3              4                                  5       6              7
        "SELECT ticket_id, guid, ticket_text, response_text, UNIX_TIMESTAMP(ticket_lastchange), closed, assigned_guid, assigned_sec_level FROM character_ticket ORDER BY ticket_id ASC WHERE closed = '0'");

    if( !result )
    {
        barGoLink bar( 1 );

        bar.step();

        sLog.outString();
        sLog.outString(">> Loaded `character_ticket`, no open tickets.");
        return;
    }

    barGoLink bar( (int)result->GetRowCount() );

    do
    {
        bar.step();

        Field* fields = result->Fetch();

        uint32 guidlow = fields[0].GetUInt32();
        if (!guidlow)
            continue;

        ObjectGuid guid = ObjectGuid(HIGHGUID_PLAYER, guidlow);

        GMTicket& ticket = m_GMTicketMap[guid];

        if (!ticket.GetPlayerGuid().IsEmpty())              // already exist
        {
            CharacterDatabase.PExecute("DELETE FROM character_ticket WHERE ticket_id = '%u'", fields[4].GetUInt32());
            continue;
        }

        ticket.Init(fields[0].GetUInt32(), guid, fields[2].GetCppString(), fields[3].GetCppString(), time_t(fields[4].GetUInt64()), fields[5].GetUInt8(), ObjectGuid(HIGHGUID_PLAYER, fields[6].GetUInt32()), fields[7].GetUInt8());
        m_GMTicketListByCreatingOrder.push_back(&ticket);

    } while (result->NextRow());
    delete result;

    sLog.outString();
    sLog.outString(">> Loaded " SIZEFMTD " GM tickets", GetTicketCount());
}

void GMTicketMgr::CloseAll()
{
    for(GMTicketMap::const_iterator itr = m_GMTicketMap.begin(); itr != m_GMTicketMap.end(); ++itr)
    {
        if(Player* owner = sObjectMgr.GetPlayer(itr->first))
            owner->GetSession()->SendGMTicketGetTicket(0x0A, 0, false);
    }
    CharacterDatabase.Execute("UPDATE character_ticket SET closed = '1'");
    m_GMTicketListByCreatingOrder.clear();
    m_GMTicketMap.clear();
}
