Extension { #name : #MemoryFileSystemFile }

{ #category : #'*Winter-Pharo6-Support' }
MemoryFileSystemFile >> binaryWriteStream [

	^ MemoryFileWriteStream on: self
]

{ #category : #'*Winter-Pharo6-Support' }
MemoryFileSystemFile >> close [
	
]

{ #category : #'*Winter-Pharo6-Support' }
MemoryFileSystemFile >> size [

	^ size
]

{ #category : #'*Winter-Pharo6-Support' }
MemoryFileSystemFile >> updateContents: aCollection [

	bytes := aCollection.
	self updateSize: aCollection size
]
