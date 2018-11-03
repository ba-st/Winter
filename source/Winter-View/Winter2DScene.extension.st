Extension { #name : #Winter2DScene }

{ #category : #'*Winter-View' }
Winter2DScene >> displayScene: aSurface [
	self game surfaceContainer
		image: aSurface asForm
]
