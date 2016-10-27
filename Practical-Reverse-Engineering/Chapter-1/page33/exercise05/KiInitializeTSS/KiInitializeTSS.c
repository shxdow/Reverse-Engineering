VOID NTAPI KiInitializeTSS(PKTSS Tss)
{
	// line 7
	Tss.Flags = 0;

	// line 8
	Tss.LDT = 0;

	// line 9
	Tss.IoMapBase = 0x20AC;

	// line 10
	Tss.Ss0 = 0x10;

	return 4;
}

kd>dt _KTSS
nt!_KTSS
   +0x000 Backlink         : Uint2B
   +0x002 Reserved0        : Uint2B
   +0x004 Esp0             : Uint4B
   +0x008 Ss0              : Uint2B
   +0x00a Reserved1        : Uint2B
   +0x00c NotUsed1         : [4] Uint4B
   +0x01c CR3              : Uint4B
   +0x020 Eip              : Uint4B
   +0x024 EFlags           : Uint4B
   +0x028 Eax              : Uint4B
   +0x02c Ecx              : Uint4B
   +0x030 Edx              : Uint4B
   +0x034 Ebx              : Uint4B
   +0x038 Esp              : Uint4B
   +0x03c Ebp              : Uint4B
   +0x040 Esi              : Uint4B
   +0x044 Edi              : Uint4B
   +0x048 Es               : Uint2B
   +0x04a Reserved2        : Uint2B
   +0x04c Cs               : Uint2B
   +0x04e Reserved3        : Uint2B
   +0x050 Ss               : Uint2B
   +0x052 Reserved4        : Uint2B
   +0x054 Ds               : Uint2B
   +0x056 Reserved5        : Uint2B
   +0x058 Fs               : Uint2B
   +0x05a Reserved6        : Uint2B
   +0x05c Gs               : Uint2B
   +0x05e Reserved7        : Uint2B
   +0x060 LDT              : Uint2B
   +0x062 Reserved8        : Uint2B
   +0x064 Flags            : Uint2B
   +0x066 IoMapBase        : Uint2B
   +0x068 IoMaps           : [1] _KiIoAccessMap
   +0x208c IntDirectionMap  : [32] UChar
