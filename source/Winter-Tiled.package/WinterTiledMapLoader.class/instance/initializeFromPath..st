Initialization
initializeFromPath: aPath

	fileReference := aPath asFileReference .
	xmlParsed := fileReference binaryReadStreamDo: [ :stream | stream parseXML ]