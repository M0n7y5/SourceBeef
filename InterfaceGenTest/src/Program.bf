using System;
using SourceBeef.SDK.CSGO.Interface;
using SourceBeef.SDK.Shared.Attributes;
using System.Collections;
using System.Reflection;
using InterfaceGenTest.Test;

namespace InterfaceGenTest
{
	class Program
	{
		public static int Main(String[] args)
		{
			//scope TestClass<IFaceTest>(scope IFaceImpl());



			var type = typeof(IServerPluginCallbacks);
			var dic = scope Dictionary<int, MethodInfo>();

			Console.WriteLine(scope $"Generating VTable from {type.GetName(.. scope .())}\n");

			for (let m in type.GetMethods())
			{
				if (var attr = m.GetCustomAttribute<MethodOrderAttribute>())
				{
					dic.Add(attr.index, m);
				}
			}

			for (int i in 0 ..< dic.Count)
			{
				var m = dic[i];
				String ret = scope .();
				let returnTypeName = m.ReturnType;//.GetName(.. ret);
				let funcName = scope $"{m.Name}Func";

				Console.WriteLine(scope $"INDEX: {i}\tReturns {returnTypeName}\t{m.Name}");
			}



			Console.Read();
			return 0;
		}



	}

	class TestClass<T>
	{
		public this(T instance)
		{
			Console.WriteLine(scope $"{typeof(T).GetFullName(.. scope .())}");
		}

		/*[OnCompile(.None), Comptime]
		public static void Generate()
		{
			//T generic;
			//Debug.WriteLine("Yeeet");

			//Compiler.CreateMethod()
			let genericArgType = typeof(T);

			for (let m in genericArgType.GetMethods(.Public))
			{
			}
		}*/
	}
}