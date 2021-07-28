using System;
using SourceBeef.SDK.Shared.Enums;
namespace SourceBeef.SDK.Shared.Types
{
	[CRepr]
	struct CCommand
	{
		public int m_nArgc;
		public int m_nArgv0Size;
		public char8[512] m_pArgSBuffer;
		public char8[512] m_pArgvBuffer;
		public char8[64] m_ppArgv;
		public cmd_source_t m_source;
	}
}
