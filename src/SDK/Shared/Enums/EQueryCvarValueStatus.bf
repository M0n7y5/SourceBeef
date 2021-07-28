using System.Interop;
namespace SourceBeef.SDK.Shared.Enums
{
	enum EQueryCvarValueStatus : c_int
	{
		eQueryCvarValueStatus_ValueIntact = 0,// It got the value fine.
		eQueryCvarValueStatus_CvarNotFound = 1,
		eQueryCvarValueStatus_NotACvar = 2,// There's a ConCommand, but it's not a ConVar.
		eQueryCvarValueStatus_CvarProtected = 3// The cvar was marked with FCVAR_SERVER_CAN_NOT_QUERY, so the server
	// is not allowed to have its value.
	}
}
