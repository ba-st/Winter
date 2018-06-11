Initialization
initializeFromAbsolutePath: aPath named: aName
	path := aPath .
	name := aName.
	nativeAsset  := path asFileReference 
		binaryReadStreamDo: [ :stream | ImageReadWriter formFromStream: stream ]