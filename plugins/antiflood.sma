/* AMX Mod script.
*
* (c) 2002-2004, OLO
*  modified by the AMX Mod X Development Team
*
* This file is provided as is (no warranties).
*/

#include <amxmod>

new Float:g_Flooding[33]

public plugin_init()
{
  register_plugin("Anti Flood","0.1","default")
  register_clcmd("say","chkFlood")
  register_clcmd("say_team","chkFlood")
  register_cvar("amx_flood_time","0.75")
}

public chkFlood(id) 
{
  new Float:maxChat = get_cvar_float("amx_flood_time")

  if ( maxChat ) 
  {
    new Float:nexTime = get_gametime()

    if ( g_Flooding[id] > nexTime )   
    {
      client_print( id , print_notify , "** Stop flooding the server!" )
      g_Flooding[ id ] = nexTime + maxChat + 3.0
      return PLUGIN_HANDLED
    }

    g_Flooding[id] = nexTime + maxChat
  }

  return PLUGIN_CONTINUE
}