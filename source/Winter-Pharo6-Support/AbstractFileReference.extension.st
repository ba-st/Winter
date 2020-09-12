Extension { #name : #AbstractFileReference }

{ #category : #'*Winter-Pharo6-Support' }
AbstractFileReference >> binaryWriteStream [
	"Answer a binary write stream on the receiver"

	^ self subclassResponsibility
]

{ #category : #'*Winter-Pharo6-Support' }
AbstractFileReference >> binaryWriteStreamDo: aBlock [
	"Pass a binary write stream on the receiver to the supplied block, and ensure that the stream is closed after evaluation."

	| stream |

	stream := self binaryWriteStream.
	^ [ aBlock value: stream ] 
		ensure: [ stream close ]
]
