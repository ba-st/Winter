Extension { #name : #Rectangle }

{ #category : #'*Winter-Core2D' }
Rectangle class >> fastOrigin: o corner: c [

	^ self new setOrigin: o corner: c 
]

{ #category : #'*Winter-Core2D' }
Rectangle >> setOrigin: anOriginPoint corner: aCornerPoint [

	origin := anOriginPoint.
	corner := aCornerPoint
]
