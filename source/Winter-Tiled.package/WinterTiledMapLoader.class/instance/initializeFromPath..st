Initialization
initializeFromPath: aPath

	xmlParsed := aPath asFileReference binaryReadStreamDo: [ :stream | stream parseXML ]