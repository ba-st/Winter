finalization
finalizeResourceData: handle
	^handle ifNotNil: [self primReleaseContraint: handle].