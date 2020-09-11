Extension { #name : #Rectangle }

{ #category : #'*Winter-Core' }
Rectangle class >> fastOrigin: o corner: c [

	^ self new setOrigin: o corner: c
]

{ #category : #'*Winter-Core' }
Rectangle >> setOrigin: anOriginPoint corner: aCornerPoint [

	origin := anOriginPoint.
	corner := aCornerPoint
]
