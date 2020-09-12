Extension { #name : #FileHandle }

{ #category : #'*Winter-Pharo6-Support' }
FileHandle >> binaryWriteStream [

	^ ( File named: reference fullName ) writeStream
]
