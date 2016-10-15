lkd> uf KeReadyThread
nt!KeReadyThread:
829080f6 8bff            mov     edi,edi
829080f8 56              push    esi
829080f9 8bf0            mov     esi,eax							
829080fb 8b4650          mov     eax,dword ptr [esi+50h]
829080fe 8b4874          mov     ecx,dword ptr [eax+74h]
82908101 f6c107          test    cl,7
82908104 7409            je      nt!KeReadyThread+0x19 (8290810f)

nt!KeReadyThread+0x10:
82908106 e8e7cef6ff      call    nt!KiInSwapSingleProcess (82874ff2)
8290810b 84c0            test    al,al
8290810d 7505            jne     nt!KeReadyThread+0x1e (82908114)

nt!KeReadyThread+0x19:
8290810f e87c70feff      call    nt!KiFastReadyThread (828ef190)

nt!KeReadyThread+0x1e:
82908114 5e              pop     esi
82908115 c3              ret

lkd> dt _KTHREAD
nt!_KTHREAD
   +0x000 Header           : _DISPATCHER_HEADER
   +0x010 CycleTime        : Uint8B
   +0x018 HighCycleTime    : Uint4B
   +0x020 QuantumTarget    : Uint8B
   +0x028 InitialStack     : Ptr32 Void
   +0x02c StackLimit       : Ptr32 Void
   +0x030 KernelStack      : Ptr32 Void
   +0x034 ThreadLock       : Uint4B
   +0x038 WaitRegister     : _KWAIT_STATUS_REGISTER
   +0x039 Running          : UChar
   +0x03a Alerted          : [2] UChar
   +0x03c KernelStackResident : Pos 0, 1 Bit
   +0x03c ReadyTransition  : Pos 1, 1 Bit
   +0x03c ProcessReadyQueue : Pos 2, 1 Bit
   +0x03c WaitNext         : Pos 3, 1 Bit
   +0x03c SystemAffinityActive : Pos 4, 1 Bit
   +0x03c Alertable        : Pos 5, 1 Bit
   +0x03c GdiFlushActive   : Pos 6, 1 Bit
   +0x03c UserStackWalkActive : Pos 7, 1 Bit
   +0x03c ApcInterruptRequest : Pos 8, 1 Bit
   +0x03c ForceDeferSchedule : Pos 9, 1 Bit
   +0x03c QuantumEndMigrate : Pos 10, 1 Bit
   +0x03c UmsDirectedSwitchEnable : Pos 11, 1 Bit
   +0x03c TimerActive      : Pos 12, 1 Bit
   +0x03c Reserved         : Pos 13, 19 Bits
   +0x03c MiscFlags        : Int4B
   +0x040 ApcState         : _KAPC_STATE
   +0x040 ApcStateFill     : [23] UChar
   +0x057 Priority         : Char
   +0x058 NextProcessor    : Uint4B
   +0x05c DeferredProcessor : Uint4B
   +0x060 ApcQueueLock     : Uint4B
   +0x064 ContextSwitches  : Uint4B
   +0x068 State            : UChar
   +0x069 NpxState         : Char
   +0x06a WaitIrql         : UChar
   +0x06b WaitMode         : Char
   +0x06c WaitStatus       : Int4B
   +0x070 WaitBlockList    : Ptr32 _KWAIT_BLOCK
   +0x074 WaitListEntry    : _LIST_ENTRY
   +0x074 SwapListEntry    : _SINGLE_LIST_ENTRY
   +0x07c Queue            : Ptr32 _KQUEUE
   +0x080 WaitTime         : Uint4B
   +0x084 KernelApcDisable : Int2B
   +0x086 SpecialApcDisable : Int2B
   +0x084 CombinedApcDisable : Uint4B
   +0x088 Teb              : Ptr32 Void
   +0x090 Timer            : _KTIMER
   +0x0b8 AutoAlignment    : Pos 0, 1 Bit
   +0x0b8 DisableBoost     : Pos 1, 1 Bit
   +0x0b8 EtwStackTraceApc1Inserted : Pos 2, 1 Bit
   +0x0b8 EtwStackTraceApc2Inserted : Pos 3, 1 Bit
   +0x0b8 CalloutActive    : Pos 4, 1 Bit
   +0x0b8 ApcQueueable     : Pos 5, 1 Bit
   +0x0b8 EnableStackSwap  : Pos 6, 1 Bit
   +0x0b8 GuiThread        : Pos 7, 1 Bit
   +0x0b8 UmsPerformingSyscall : Pos 8, 1 Bit
   +0x0b8 ReservedFlags    : Pos 9, 23 Bits
   +0x0b8 ThreadFlags      : Int4B
   +0x0bc ServiceTable     : Ptr32 Void
   +0x0c0 WaitBlock        : [4] _KWAIT_BLOCK
   +0x120 QueueListEntry   : _LIST_ENTRY
   +0x128 TrapFrame        : Ptr32 _KTRAP_FRAME
   +0x12c FirstArgument    : Ptr32 Void
   +0x130 CallbackStack    : Ptr32 Void
   +0x130 CallbackDepth    : Uint4B
   +0x134 ApcStateIndex    : UChar
   +0x135 BasePriority     : Char
   +0x136 PriorityDecrement : Char
   +0x136 ForegroundBoost  : Pos 0, 4 Bits
   +0x136 UnusualBoost     : Pos 4, 4 Bits
   +0x137 Preempted        : UChar
   +0x138 AdjustReason     : UChar
   +0x139 AdjustIncrement  : Char
   +0x13a PreviousMode     : Char
   +0x13b Saturation       : Char
   +0x13c SystemCallNumber : Uint4B
   +0x140 FreezeCount      : Uint4B
   +0x144 UserAffinity     : _GROUP_AFFINITY
   +0x150 Process          : Ptr32 _KPROCESS
   +0x154 Affinity         : _GROUP_AFFINITY
   +0x160 IdealProcessor   : Uint4B
   +0x164 UserIdealProcessor : Uint4B
   +0x168 ApcStatePointer  : [2] Ptr32 _KAPC_STATE
   +0x170 SavedApcState    : _KAPC_STATE
   +0x170 SavedApcStateFill : [23] UChar
   +0x187 WaitReason       : UChar
   +0x188 SuspendCount     : Char
   +0x189 Spare1           : Char
   +0x18a OtherPlatformFill : UChar
   +0x18c Win32Thread      : Ptr32 Void
   +0x190 StackBase        : Ptr32 Void
   +0x194 SuspendApc       : _KAPC
   +0x194 SuspendApcFill0  : [1] UChar
   +0x195 ResourceIndex    : UChar
   +0x194 SuspendApcFill1  : [3] UChar
   +0x197 QuantumReset     : UChar
   +0x194 SuspendApcFill2  : [4] UChar
   +0x198 KernelTime       : Uint4B
   +0x194 SuspendApcFill3  : [36] UChar
   +0x1b8 WaitPrcb         : Ptr32 _KPRCB
   +0x194 SuspendApcFill4  : [40] UChar
   +0x1bc LegoData         : Ptr32 Void
   +0x194 SuspendApcFill5  : [47] UChar
   +0x1c3 LargeStack       : UChar
   +0x1c4 UserTime         : Uint4B
   +0x1c8 SuspendSemaphore : _KSEMAPHORE
   +0x1c8 SuspendSemaphorefill : [20] UChar
   +0x1dc SListFaultCount  : Uint4B
   +0x1e0 ThreadListEntry  : _LIST_ENTRY
   +0x1e8 MutantListHead   : _LIST_ENTRY
   +0x1f0 SListFaultAddress : Ptr32 Void
   +0x1f4 ThreadCounters   : Ptr32 _KTHREAD_COUNTERS
   +0x1f8 XStateSave       : Ptr32 _XSTATE_SAVE
