using System;
namespace SourceBeef.SDK.Shared.Types
{
	public abstract class Singleton//<T> where T : class
	{
		public static Object Instance;

		public this(Object instance)
		{
			Instance = instance;
		}

		public T Get<T>() where T : class
		{
			return Instance as T;
		}
	}
}
