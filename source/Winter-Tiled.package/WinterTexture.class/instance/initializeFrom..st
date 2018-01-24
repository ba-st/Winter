Initialization
initializeFrom: aFileReference

	image := aFileReference 
		binaryReadStreamDo: [ :stream | ImageReadWriter formFromStream: stream ]