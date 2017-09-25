Initialization
initializeFromAbsolutePath: aPath
	fileReference := FileReference fileSystem: FileSystem disk path: aPath .
	spriteForm := fileReference
		binaryReadStreamDo: [ :stream | ImageReadWriter formFromStream: stream ]