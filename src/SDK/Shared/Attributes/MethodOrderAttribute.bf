using System;
namespace SourceBeef.SDK.Shared.Attributes
{
	[AttributeUsage(.All, .AlwaysIncludeTarget | .ReflectAttribute)]
	struct MethodOrderAttribute : Attribute
	{
		public int index;

		public this(int idx)
		{
			this.index = idx;
		}
	}
}
