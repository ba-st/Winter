Extension { #name : #Rectangle }

{ #category : #'*Winter-Core2D' }
Rectangle class >> fastOrigin: o corner: c [

	^ self new setOrigin: o corner: c 
]

{ #category : #'*Winter-Core2D' }
Rectangle >> setOrigin: o corner: c [

	origin := o.
	corner := c.
]
