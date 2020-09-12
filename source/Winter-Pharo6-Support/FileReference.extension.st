Extension { #name : #FileReference }

{ #category : #'*Winter-Pharo6-Support' }
FileReference >> binaryWriteStream [
	"Answer a buffered binary write stream on the receiver"

	^ ZnBufferedWriteStream on: (filesystem binaryWriteStreamOn: self path)
]
