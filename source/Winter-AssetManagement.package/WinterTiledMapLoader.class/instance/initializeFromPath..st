Initialization
initializeFromPath: aPath
	fileReference := FileReference fileSystem: FileSystem disk path: aPath.
	xmlParsed := fileReference binaryReadStreamDo: [ :stream | stream parseXML ]