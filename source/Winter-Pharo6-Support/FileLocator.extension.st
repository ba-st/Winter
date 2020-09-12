Extension { #name : #FileLocator }

{ #category : #'*Winter-Pharo6-Support' }
FileLocator >> binaryWriteStream [
	"Answer a binary write stream on the receiver"

	^ self resolve binaryWriteStream
]
