Parsing
imageFrom: imagePathString
	^ FileReference fileSystem: FileSystem disk path: (Path from: imagePathString)