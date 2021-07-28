namespace SourceBeef
{
	using System;
	using System.IO;
	using System.Interop;
	using SourceBeef.SDK.Shared.Enums;
	using SourceBeef.SDK.Shared;
	using SourceBeef.SDK.Shared.Types;

	static
	{
		/*struct IServerEntity;
		struct KeyValues;*/
	}

	public class CPluginBridge : IPluginInterface
	{
		public static IPluginInterface pluginInst;
		public CPlugin<CPluginBridge> pluginCallback;

		public this(IPluginInterface pluginInstance)
		{
			pluginInst = pluginInstance;
			pluginCallback = GetPluginCallback<CPluginBridge>(this);
		}

		public CPlugin<T> GetPluginCallback<T>(T methods) where T : IPluginInterface
		{
			CPlugin<T> _plugin = default;
			//_plugin.vtable = new CPluginVTable<T>();
			/*_plugin.vtable.Load = => methods.Load;
			_plugin.vtable.Unload = => methods.Unload;
			_plugin.vtable.Pause = => methods.Pause;
			_plugin.vtable.UnPause = => methods.UnPause;
			_plugin.vtable.GetPluginDescription = => methods.GetPluginDescription;
			_plugin.vtable.LevelInit = => methods.LevelInit;
			_plugin.vtable.ServerActivate = => methods.ServerActivate;
			_plugin.vtable.GameFrame = => methods.GameFrame;
			_plugin.vtable.LevelShutdown = => methods.LevelShutdown;
			_plugin.vtable.ClientActive = => methods.ClientActive;
			_plugin.vtable.ClientDisconnect = => methods.ClientDisconnect;
			_plugin.vtable.ClientPutInServer = => methods.ClientPutInServer;
			_plugin.vtable.SetClientCommand = => methods.SetClientCommand;
			_plugin.vtable.ClientSettingsChanged = => methods.ClientSettingsChanged;
			_plugin.vtable.ClientConnect = => methods.ClientConnect;
			_plugin.vtable.ClientCommand = => methods.ClientCommand;
			_plugin.vtable.NetworkIDValidated = => methods.NetworkIDValidated;
			_plugin.vtable.OnQueryCvarValueFinished = => methods.OnQueryCvarValueFinished;
			_plugin.vtable.OnEdictAllocated = => methods.OnEdictAllocated;
			_plugin.vtable.OnEdictFreed = => methods.OnEdictFreed;*/
			//_plugin.vtable.BNetworkCryptKeyCheckRequired = => methods.BNetworkCryptKeyCheckRequired;
			//_plugin.vtable.OnEdictFreed = => methods.OnEdictFreed;
			/*_plugin.vtable.FireGameEvent = => methods.FireGameEvent;
			_plugin.vtable.GetCommandIndex = => methods.GetCommandIndex;*/

			return _plugin;
		}

		public bool Load(CreateInterfaceFn interfaceFactory, CreateInterfaceFn gameServerFactory)
		{
			SourceBeefAPI.Initiate(interfaceFactory, gameServerFactory);
			return pluginInst.Load(interfaceFactory, gameServerFactory);
		}

		public void Unload()
		{
			pluginInst.Unload();
		}

		public void Pause()
		{
			pluginInst.Pause();
		}

		public void UnPause()
		{
			pluginInst.UnPause();
		}

		public char8* GetPluginDescription()
		{
			return pluginInst.GetPluginDescription();
		}

		public void LevelInit(char8* mapname)
		{
			pluginInst.LevelInit(mapname);
		}

		public void ServerActivate(edict_t pEdictList, int edictCount, int clientMax)
		{
			pluginInst.ServerActivate(pEdictList, edictCount, clientMax);
		}

		public void GameFrame(bool simulating)
		{
			pluginInst.GameFrame(simulating);
		}

		public void LevelShutdown()
		{
			pluginInst.LevelShutdown();
		}

		public void ClientActive(edict_t entity)
		{
			pluginInst.ClientActive(entity);
		}

		public void ClientDisconnect(edict_t pEntity)
		{
			pluginInst.ClientDisconnect(pEntity);
		}

		public void ClientPutInServer(edict_t* pEntity, char8* playername)
		{
			pluginInst.ClientPutInServer(pEntity, playername);
		}

		public void SetClientCommand(int index)
		{
			pluginInst.SetClientCommand(index);
		}

		public void ClientSettingsChanged(edict_t pEdict)
		{
			pluginInst.ClientSettingsChanged(pEdict);
		}

		public PluginResult ClientConnect(bool* bAllowConnect, edict_t* pEntity, char8* pszName, char8* pszAddress, char8* reject, int maxrejectlen)
		{
			return pluginInst.ClientConnect(bAllowConnect, pEntity, pszName, pszAddress, reject, maxrejectlen);
		}

		public PluginResult ClientCommand(void* pEntity, CCommand* args)
		{
			return pluginInst.ClientCommand(pEntity, args);
		}

		public PluginResult NetworkIDValidated(char8* pszUserName, char8* pszNetworkID)
		{
			return pluginInst.NetworkIDValidated(pszUserName, pszNetworkID);
		}

		public void OnQueryCvarValueFinished(QueryCvarCookie_t iCookie, edict_t* pPlayerEntity, EQueryCvarValueStatus eStatus, char8* pCvarName, char8* pCvarValue)
		{
			pluginInst.OnQueryCvarValueFinished(iCookie, pPlayerEntity, eStatus, pCvarName, pCvarValue);
		}

		public void OnEdictAllocated(edict_t* edict)
		{
			pluginInst.OnEdictAllocated(edict);
		}

		public void OnEdictFreed(edict_t* edict)
		{
			pluginInst.OnEdictFreed(edict);
		}

		/*public void FireGameEvent(KeyValues* event)
		{
			pluginInst.FireGameEvent(event);
		}

		public int GetCommandIndex()
		{
			return 0;
		}*/
		public bool BNetworkCryptKeyCheckRequired(
			uint32 unFromIP, uint16 usFromPort, uint32 unAccountIdProvidedByClient, bool bClientWantsToUseCryptKey)
		{
			return pluginInst.BNetworkCryptKeyCheckRequired(unFromIP, usFromPort, unAccountIdProvidedByClient, bClientWantsToUseCryptKey);
		}

		public bool BNetworkCryptKeyValidate(
			uint32 unFromIP,
			uint16 usFromPort,
			uint32 unAccountIdProvidedByClient, int32 nEncryptionKeyIndexFromClient, int32 numEncryptedBytesFromClient, uint8* pbEncryptedBufferFromClient, uint8* pbPlainTextKeyForNetchan)
		{
			return default;
		}
	}

	[CRepr]
	struct CPluginVTable<T>
	{
		public function bool(T this, CreateInterfaceFn interfaceFactory, CreateInterfaceFn gameServerFactory) LoadFunc;
		//public LoadFunc Load;

		public function void UnloadFunc(T this);
		public UnloadFunc Unload;


		public function void PauseFunc(T this);
		public PauseFunc Pause;


		public function void UnPauseFunc(T this);
		public UnPauseFunc UnPause;


		public function char8* GetPluginDescriptionFunc(T this);
		public GetPluginDescriptionFunc GetPluginDescription;


		public function void LevelInitFunc(T this, char8* mapname);
		public LevelInitFunc LevelInit;


		public function void ServerActivateFunc(T this, edict_t pEdictList, c_int edictCount, c_int clientMax);
		public ServerActivateFunc ServerActivate;


		public function void GameFrameFunc(T this, bool simulating);
		public GameFrameFunc GameFrame;


		public function void LevelShutdownFunc(T this);
		public LevelShutdownFunc LevelShutdown;


		public function void ClientActiveFunc(T this, edict_t entity);
		public ClientActiveFunc ClientActive;


		public function void ClientDisconnectFunc(T this, edict_t pEntity);
		public ClientDisconnectFunc ClientDisconnect;


		public function void ClientPutInServerFunc(T this, edict_t* pEntity, char8* playername);
		public ClientPutInServerFunc ClientPutInServer;


		public function void SetClientCommandFunc(T this, c_int index);
		public SetClientCommandFunc SetClientCommand;


		public function void ClientSettingsChangedFunc(T this, edict_t pEdict);
		public ClientSettingsChangedFunc ClientSettingsChanged;


		public function PluginResult ClientConnectFunc(T this, bool* bAllowConnect, edict_t* pEntity, char8* pszName, char8* pszAddress, char8* reject, c_int maxrejectlen);
		public ClientConnectFunc ClientConnect;


		public function PluginResult ClientCommandFunc(T this, void* pEntity, CCommand* args);
		public ClientCommandFunc ClientCommand;

		// A user has had their network id setup and validated
		public function PluginResult NetworkIDValidatedFunc(T this, char8* pszUserName, char8* pszNetworkID);
		public NetworkIDValidatedFunc NetworkIDValidated;

		// This is called when a query from IServerPluginHelpers::StartQueryCvarValue is finished.
		// iCookie is the value returned by IServerPluginHelpers::StartQueryCvarValue.
		// Added with version 2 of the interface.

		public function void OnQueryCvarValueFinishedFunc(T this, QueryCvarCookie_t iCookie, edict_t* pPlayerEntity, EQueryCvarValueStatus eStatus, char8* pCvarName, char8* pCvarValue);
		public OnQueryCvarValueFinishedFunc OnQueryCvarValueFinished;

		// added with version 3 of the interface.

		public function void OnEdictAllocatedFunc(T this, edict_t* edict);
		public OnEdictAllocatedFunc OnEdictAllocated;

		public function void OnEdictFreedFunc(T this, edict_t* edict);
		public OnEdictFreedFunc OnEdictFreed;

		public function void BNetworkCryptKeyCheckRequiredFunc(T this,
			uint32 unFromIP,
			uint16 usFromPort,
			uint32 unAccountIdProvidedByClient,
			bool bClientWantsToUseCryptKey);
		public BNetworkCryptKeyCheckRequiredFunc BNetworkCryptKeyCheckRequired;

		public function void BNetworkCryptKeyValidateFunc(T this,
			uint32 unFromIP,
			uint16 usFromPort,
			uint32 unAccountIdProvidedByClient,
			c_int nEncryptionKeyIndexFromClient,
			c_int numEncryptedBytesFromClient,
			uint8* pbEncryptedBufferFromClient,
			uint8* pbPlainTextKeyForNetchan);
		public BNetworkCryptKeyCheckRequiredFunc BNetworkCryptKeyValidate;

		/*public function void FireGameEventFunc(T this, KeyValues* event);
		public FireGameEventFunc FireGameEvent;

		public function int GetCommandIndexFunc(T this);
		public GetCommandIndexFunc GetCommandIndex;*/
	}



	interface IPluginInterface
	{
		public bool Load(CreateInterfaceFn interfaceFactory, CreateInterfaceFn gameServerFactory)
		{
			return true;
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
			return "My Plugin";
		}

		public void LevelInit(char8* mapname)
		{
		}

		public void ServerActivate(edict_t pEdictList, c_int edictCount, c_int clientMax)
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

		public void SetClientCommand(c_int index)
		{
		}

		public void ClientSettingsChanged(edict_t pEdict)
		{
		}

		public PluginResult ClientConnect(bool* bAllowConnect, edict_t* pEntity, char8* pszName, char8* pszAddress, char8* reject, c_int maxrejectlen)
		{
			return .PLUGIN_CONTINUE;
		}

		public PluginResult ClientCommand(void* pEntity, CCommand* args)
		{
			return .PLUGIN_CONTINUE;
		}

		public PluginResult NetworkIDValidated(char8* pszUserName, char8* pszNetworkID)
		{
			return .PLUGIN_CONTINUE;
		}

		public void OnQueryCvarValueFinished(QueryCvarCookie_t iCookie, edict_t* pPlayerEntity, EQueryCvarValueStatus eStatus, char8* pCvarName, char8* pCvarValue)
		{
		}

		public void OnEdictAllocated(edict_t* edict)
		{
		}

		public void OnEdictFreed(edict_t* edict)
		{
		}

		public bool BNetworkCryptKeyCheckRequired(
			uint32 unFromIP,
			uint16 usFromPort,
			uint32 unAccountIdProvidedByClient,
			bool bClientWantsToUseCryptKey)
		{
			return false;
		}

		public bool BNetworkCryptKeyValidate(
			uint32 unFromIP,
			uint16 usFromPort,
			uint32 unAccountIdProvidedByClient,
			c_int nEncryptionKeyIndexFromClient,
			c_int numEncryptedBytesFromClient,
			uint8* pbEncryptedBufferFromClient,
			uint8* pbPlainTextKeyForNetchan)
		{
			return false;
		}

		/*public void FireGameEvent(KeyValues* event)
		{
		}

		public int GetCommandIndex()
		{
			return 0;
		}*/
	}
}