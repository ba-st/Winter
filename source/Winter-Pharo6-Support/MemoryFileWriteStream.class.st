"
A file write stream - but within memory
"
Class {
	#name : #MemoryFileWriteStream,
	#superclass : #Object,
	#instVars : [
		'file',
		'stream'
	],
	#category : #'Winter-Pharo6-Support'
}

{ #category : #'instance creation' }
MemoryFileWriteStream class >> on: aFile [

	^ self new
		file: aFile;
		yourself
]

{ #category : #'as yet unclassified' }
MemoryFileWriteStream >> binary [

	stream ifNotNil: [ stream binary ]
]

{ #category : #'opening-closing' }
MemoryFileWriteStream >> close [

	self flush.
	self stream close.
	file close
]

{ #category : #'opening-closing' }
MemoryFileWriteStream >> closed [

	^ file closed
]

{ #category : #accessing }
MemoryFileWriteStream >> file: aMemoryFileSystemFile [

	file := aMemoryFileSystemFile
]

{ #category : #writing }
MemoryFileWriteStream >> flush [

	file updateContents: self stream contents
]

{ #category : #testing }
MemoryFileWriteStream >> isBinary [

	^ self stream isBinary
]

{ #category : #writing }
MemoryFileWriteStream >> next: anInteger putAll: aCollection startingAt: startIndex [

	^ self stream next: anInteger putAll: aCollection startingAt: startIndex
]

{ #category : #writing }
MemoryFileWriteStream >> nextPut: aCollection [

	^ self stream nextPut: aCollection
]

{ #category : #writing }
MemoryFileWriteStream >> nextPutAll: aCollection [

	^ self stream nextPutAll: aCollection
]

{ #category : #positioning }
MemoryFileWriteStream >> position [

	^ self stream position
]

{ #category : #'as yet unclassified' }
MemoryFileWriteStream >> reset [

	stream ifNotNil: [ stream reset ]
]

{ #category : #positioning }
MemoryFileWriteStream >> setToEnd [

	^ self stream setToEnd
]

{ #category : #accessing }
MemoryFileWriteStream >> size [

	^ file size
]

{ #category : #accessing }
MemoryFileWriteStream >> stream [

	^ stream ifNil: [ stream := WriteStream on: file bytes from: 1 to: file size ]
]
