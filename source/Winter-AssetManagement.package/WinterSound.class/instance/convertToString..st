Initialization
convertToString: aFilePath
	^ aFilePath inject: String new into: [ :each :acc | acc , each ]