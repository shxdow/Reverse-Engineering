



NTKERNELAPI VOID KeInitializeApc (
	
	IN PRKAPC Apc,
	
	IN PKTHREAD Thread,
	
	IN KAPC_ENVIRONMENT Environment,
	
	IN PKKERNEL_ROUTINE KernelRoutine,
	
	IN PKRUNDOWN_ROUTINE RundownRoutine OPTIONAL,
	
	IN PKNORMAL_ROUTINE NormalRoutine OPTIONAL,
	
	IN KPROCESSOR_MODE ApcMode,
	
	IN PVOID NormalContext

)
{
	if (Apc.Size == 2)
	{
		// Thread.ApcStateIndex saved somewhere
	}

	Environment. = ecx ?	
	

}
