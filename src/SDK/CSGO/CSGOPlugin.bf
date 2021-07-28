using SourceBeef.SDK.Shared.Types;
using SourceBeef.SDK.CSGO.Interface;
using SourceBeef.SDK.Shared;
using SourceBeef.SDK.Shared.Enums;
namespace SourceBeef.SDK.CSGO
{
	class CSGOPlugin : CPluginBase<IServerPluginCallbacks>, IServerPluginCallbacks
	{
		public this() : base(this)
		{
		}
		public bool Load(CreateInterfaceFn interfaceFactory, CreateInterfaceFn gameServerFactory)
		{
			return default;
		}

		public void Unload()
		{
		}

		public void Pause()
		{
		}

		public void UnPause()
		{
		}

		public char8* GetPluginDescription()
		{
			return default;
		}

		public void LevelInit(char8* mapname)
		{
		}

		public void ServerActivate(edict_t pEdictList, int32 edictCount, int32 clientMax)
		{
		}

		public void GameFrame(bool simulating)
		{
		}

		public void LevelShutdown()
		{
		}

		public void ClientActive(edict_t entity)
		{
		}

		public void ClientFullyConnect(edict_t entity)
		{
		}

		public void ClientDisconnect(edict_t pEntity)
		{
		}

		public void ClientPutInServer(edict_t* pEntity, char8* playername)
		{
		}

		public void SetClientCommand(int32 index)
		{
		}

		public void ClientSettingsChanged(edict_t pEdict)
		{
		}

		public PluginResult ClientConnect(bool* bAllowConnect, edict_t* pEntity, char8* pszName, char8* pszAddress, char8* reject, int32 maxrejectlen)
		{
			return default;
		}

		public PluginResult ClientCommand(void* pEntity, CCommand* args)
		{
			return default;
		}

		public PluginResult NetworkIDValidated(char8* pszUserName, char8* pszNetworkID)
		{
			return default;
		}

		public void OnQueryCvarValueFinished(int32 iCookie, edict_t* pPlayerEntity, SourceBeef.SDK.Shared.Enums.EQueryCvarValueStatus eStatus, char8* pCvarName, char8* pCvarValue)
		{
		}

		public void OnEdictAllocated(edict_t* edict)
		{
		}

		public void OnEdictFreed(edict_t* edict)
		{
		}

		public bool BNetworkCryptKeyCheckRequired(uint32 unFromIP, uint16 usFromPort, uint32 unAccountIdProvidedByClient, bool bClientWantsToUseCryptKey)
		{
			return default;
		}

		public bool BNetworkCryptKeyValidate(uint32 unFromIP, uint16 usFromPort, uint32 unAccountIdProvidedByClient, int32 nEncryptionKeyIndexFromClient, int32 numEncryptedBytesFromClient, uint8* pbEncryptedBufferFromClient, uint8* pbPlainTextKeyForNetchan)
		{
			return default;
		}
	}
}
