/*
	File:		ComponentThing.r

	Contains:	Resources common to all components

	Copyright:	� 1997-1999 by Apple Computer, Inc., all rights reserved.

*/

/*---------------------------------------------------------------------*/

#include "MacTypes.r"
#include "Components.r"

enum
{
	kComponentThingResType			= 'thng',
	kComponentNameStringResType		= 'strn',
	kComponentInfoStringResType		= 'stri'
};

#ifndef TARGET_REZ_MAC_68K
#define TARGET_REZ_MAC_68K 0
#endif


#if !TARGET_OS_MAC
	#if	TARGET_OS_WIN32
		#define Target_PlatformType			platformWin32
	#endif

	#if TARGET_OS_UNIX
		#if TARGET_CPU_MIPS
			#define Target_PlatformType		platformIRIXmips
		#endif
		#if TARGET_CPU_SPARC
			#define Target_PlatformType		platformSunOSsparc
		#endif
	#endif

	#ifndef Target_PlatformType
		#error get a real platform type
	#endif
#endif

#if	TARGET_OS_MAC
	#ifndef MW_REZ
		#if TARGET_REZ_MAC_PPC
			read kComponentType (kComponentBaseIDPPC, COMPONENT_NAME_STRING) $$Shell("RsrcDir")COMPONENT_PPC_PEF_STRING;
		#else
			Include $$Shell("RsrcDir")COMPONENT_68K_CODE_STRING 'proc' (0) as kComponentType ( kComponentBaseID68K );
		#endif
	#endif
#else
	resource 'dlle' (kComponentBaseID) {
		COMPONENT_ENTRY_POINT_STRING
	};
#endif

resource kComponentNameStringResType (kComponentBaseID)
{
	COMPONENT_NAME_STRING
};

resource kComponentInfoStringResType (kComponentBaseID+1)
{
	COMPONENT_INFO_STRING
};

resource kComponentThingResType (kComponentBaseID, COMPONENT_NAME_STRING) {
	kComponentType,					// component type
	kComponentSubType,				// component subtype
	kComponentManufactureType,		// component manufacturer

	kComponentFlags,				// flags
	kComponentFlags,				// reserved

#if TARGET_REZ_MAC_68K
	kComponentType,					// code resource type	
	kComponentBaseID,				// code resource ID
#else
	0,								// code resource type	
	0,								// code resource ID
#endif

	kComponentNameStringResType,	// name resource type
	kComponentBaseID,				// name resource ID
	kComponentInfoStringResType,	// info resource type
	kComponentBaseID+1,				// info resource ID
	0,								// icon resource type
	0,								// icon resource ID

	kComponentVersion,				// version
#if !TARGET_REZ_MAC_68K
	componentHasMultiplePlatforms |
#endif
	kComponentRegFlags,				// registration flags
	0,								// icon
	{
#if TARGET_OS_MAC
	#if TARGET_REZ_MAC_68K
		kComponentFlags,							// flags
		kComponentType, kComponentBaseID68K,		// code
		platform68k,								// platform
	#endif
		kComponentFlags,							// flags
		kComponentType, kComponentBaseIDPPC,		// code
		platformPowerPC 							// platform
#else
	kComponentFlags,								// flags
	'dlle', kComponentBaseID,						// code
	Target_PlatformType								// platform
#endif
	},
#if thng_RezTemplateVersion >= 2	// include resource map?
	'thnr', kComponentBaseID
#endif
};
