using System;
using System.Diagnostics;
namespace SourceBeef.SDK.Shared.Types
{
	[CRepr]
	struct CPlugin<T>
	{
		public CPluginVT<T>* vtable;

		public struct CPluginVT<T>
		{
			/*[OnCompile(.None), Comptime]
			public static void Generate()
			{
				//T generic;
				Debug.WriteLine("Yeeet");

				//Compiler.CreateMethod()
				let genericArgType = typeof(T);

				for (let m in genericArgType.GetMethods(.Public))
				{
				}
			}*/

		}

	}
}
