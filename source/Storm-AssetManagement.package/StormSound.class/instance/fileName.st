Accessing
fileName
	| filePathWithoutExtension |
	filePathWithoutExtension := (filePath substrings: '.') allButLast.
	^ ((self convertToString: filePathWithoutExtension) substrings: '/') last