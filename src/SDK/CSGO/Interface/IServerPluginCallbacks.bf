using System.Interop;
using SourceBeef.SDK.Shared.Enums;
using SourceBeef.SDK.Shared;
using SourceBeef.SDK.Shared.Types;
using SourceBeef.SDK.Shared.Interface;
using System;
using SourceBeef.SDK.Shared.Attributes;
namespace SourceBeef.SDK.CSGO.Interface
{

	interface IServerPluginCallbacks : ISourcePlugin
	{
		[MethodOrder(0)]
		public bool Load(CreateInterfaceFn interfaceFactory, CreateInterfaceFn gameServerFactory);

		[MethodOrder(1)]
		public void Unload();

		[MethodOrder(2)]
		public void Pause();

		[MethodOrder(3)]
		public void UnPause();

		[MethodOrder(4)]
		public char8* GetPluginDescription();

		[MethodOrder(5)]
		public void LevelInit(char8* mapname);

		[MethodOrder(6)]
		public void ServerActivate(edict_t pEdictList, c_int edictCount, c_int clientMax);

		[MethodOrder(7)]
		public void GameFrame(bool simulating);

		[MethodOrder(8)]
		public void LevelShutdown();

		[MethodOrder(9)]
		public void ClientActive(edict_t entity);

		[MethodOrder(10)]
		public void ClientFullyConnect(edict_t entity);

		[MethodOrder(11)]
		public void ClientDisconnect(edict_t pEntity);

		[MethodOrder(12)]
		public void ClientPutInServer(edict_t* pEntity, char8* playername);

		[MethodOrder(13)]
		public void SetClientCommand(c_int index);

		[MethodOrder(14)]
		public void ClientSettingsChanged(edict_t pEdict);

		[MethodOrder(15)]
		public PluginResult ClientConnect(bool* bAllowConnect, edict_t* pEntity, char8* pszName, char8* pszAddress, char8* reject, c_int maxrejectlen);

		[MethodOrder(16)]
		public PluginResult ClientCommand(void* pEntity, CCommand* args);

		[MethodOrder(17)]
		public PluginResult NetworkIDValidated(char8* pszUserName, char8* pszNetworkID);

		[MethodOrder(18)]
		public void OnQueryCvarValueFinished(QueryCvarCookie_t iCookie, edict_t* pPlayerEntity,
			EQueryCvarValueStatus eStatus, char8* pCvarName, char8* pCvarValue);

		[MethodOrder(19)]
		public void OnEdictAllocated(edict_t* edict);

		[MethodOrder(20)]
		public void OnEdictFreed(edict_t* edict);

		[MethodOrder(21)]
		public bool BNetworkCryptKeyCheckRequired(
			uint32 unFromIP,
			uint16 usFromPort,
			uint32 unAccountIdProvidedByClient,
			bool bClientWantsToUseCryptKey);

		[MethodOrder(22)]
		public bool BNetworkCryptKeyValidate(
			uint32 unFromIP,
			uint16 usFromPort,
			uint32 unAccountIdProvidedByClient,
			c_int nEncryptionKeyIndexFromClient,
			c_int numEncryptedBytesFromClient,
			uint8* pbEncryptedBufferFromClient,
			uint8* pbPlainTextKeyForNetchan);
	}
}
