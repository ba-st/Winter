Extension { #name : #MemoryFileWriteStream }

{ #category : #'*Winter-AssetManagementTests' }
MemoryFileWriteStream >> next: anInteger putAll: aCollection startingAt: startIndex [

	^ self stream next: anInteger putAll: aCollection startingAt: startIndex
]
