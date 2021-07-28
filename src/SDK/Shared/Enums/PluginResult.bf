using System.Interop;
using System;
using SourceBeef.SDK.Shared.Attributes;
namespace SourceBeef.SDK.Shared.Enums
{
	//[MethodOrder(0)]
	public enum PluginResult : c_int
	{
		/// keep going
		PLUGIN_CONTINUE,
		/// run the game dll function but use our return value instead
		PLUGIN_OVERRIDE,
		/// don't run the game dll function at all
		PLUGIN_STOP,
	}
}
