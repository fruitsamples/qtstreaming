/*
	File:		RTPRssmComponentVidResources.h

	Contains:	Declarations for Component Video RTPReassembler resources

	Copyright:	� 1997-1999 by Apple Computer Inc. all rights reserved.

*/



#ifndef __RTPRSSMCOMPONENTVIDRESOURCES__
#define __RTPRSSMCOMPONENTVIDRESOURCES__



#include "ComponentVideoRTPResources.h"



/* ---------------------------------------------------------------------------
 *		M A C R O S
 * ---------------------------------------------------------------------------
 */


/*	change these for your component */
/*	type and ID have to match what's in the code warrior project! */

#define COMPONENT_NAME_STRING					"Sample Component Video Reassembler"
#define COMPONENT_INFO_STRING					"Sample Component Video Reassembler"

#define COMPONENT_ENTRY_POINT_STRING			"RTPRssmComponentVideo_ComponentDispatch"
#define COMPONENT_PPC_PEF_STRING				"RTPRssmComponentVideo.pef"
#define COMPONENT_68K_CODE_STRING				"RTPRssmComponentVideo.rsrc"

#define COMPONENT_VIDEO_CODEC_NAME_STRING		"Component Video"



/* ---------------------------------------------------------------------------
 *		C O N S T A N T S
 * ---------------------------------------------------------------------------
 */


enum
{
	kComponentType					= kRTPReassemblerType,
	kComponentSubType				= kComponentVideoDataFormat
};

enum
{
	kComponentBaseID				= 256,
	kComponentBaseIDPPC				= kComponentBaseID
};

#define kComponentBaseID68K			( kComponentBaseID + 1 )

enum
{
	kComponentVersion				= 0x00010001,
	kComponentFlags					= 0
};

#define kComponentRegFlags			( componentDoAutoVersion | componentHasMultiplePlatforms )

enum
{
	kRTPRssmComponentVideoRegistrationResource	= kComponentBaseID,
	kRTPRssmComponentVideoStringListResource	= kComponentBaseID,
		kRTPRssmComponentVideoCodecNameString	= 1
};



#endif /* __RTPRSSMCOMPONENTVIDRESOURCES__ */
