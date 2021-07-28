using System;
using System.Interop;
using SourceBeef.SDK.Shared.Types;
using SourceBeef.SDK.Shared.Interface;
using SourceBeef.SDK.CSGO.Interface;
namespace SourceBeef.SDK.Shared
{
	class CPluginBase<T> : Singleton
	{
		static delegate bool(CreateInterfaceFn interfaceFactory, CreateInterfaceFn gameServerFactory) Load;

		/// Initialize callbacks, all callbacks will be automagically
		/// generated at compile time using interface as a API template
		CPlugin<T> m_callbacks = .();

		public this(T interfaceInstance) : base(this)
		{
			//let lol = comptype(interfaceInstance);
		}



		/// Every plugin has this as entry point
		[Export, CLink]
		static CPlugin<T>* CreateInterface(char8* name, c_int* returncode)
		{
			return default;//&pluginBridge.pluginCallback;
		}


		/*c_int GetInterfaceVersion(char8* name)
		{
			switch(StringView(name))
			{

			}
		}*/

		const String INTERFACEVERSION_ISERVERPLUGINCALLBACKS_VERSION_1 = "ISERVERPLUGINCALLBACKS001";
		const String INTERFACEVERSION_ISERVERPLUGINCALLBACKS_VERSION_2 = "ISERVERPLUGINCALLBACKS002";
		const String INTERFACEVERSION_ISERVERPLUGINCALLBACKS_VERSION_3 = "ISERVERPLUGINCALLBACKS003";
		const String INTERFACEVERSION_ISERVERPLUGINCALLBACKS = "ISERVERPLUGINCALLBACKS004";

	}
}
