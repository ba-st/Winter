Class {
	#name : #SpiderInvasionItem,
	#superclass : #WinterNonPlayer,
	#category : 'Winter-Examples-SpiderInvasion'
}

{ #category : #Actions }
SpiderInvasionItem >> die [

	self flag: 'cambiar esto'
	"arena 
		setSpritePosition: (SpiderExplode arena: arena pos: pos tick: 6)
		to: pos"
]

{ #category : #Testing }
SpiderInvasionItem >> isEmpty [

	^ false
]

{ #category : #Collision }
SpiderInvasionItem >> missileEnter: missile [

	self die.
	game removeComponent:  missile.
]

{ #category : #Collision }
SpiderInvasionItem >> spiderEnter: spider [

	| leftOrRight newPosition |

	leftOrRight := #(-1 1) atRandom.
	newPosition := spider position + (leftOrRight @ 0).
	((game scene isValidePosition: newPosition) and: [ (game scene itemAt: newPosition) isEmpty ])
		ifTrue: [ 
			game scene itemAt: newPosition put: spider.
			spider position: newPosition  ]
]

{ #category : #Accessing }
SpiderInvasionItem >> spriteSize [
	^48@48
]

{ #category : #Accessing }
SpiderInvasionItem >> translation [

"Sprites of 48x48."
	^self position - (1@1) * self spriteSize.
]

{ #category : #Accessing }
SpiderInvasionItem >> x [

	^ self position x
]

{ #category : #Accessing }
SpiderInvasionItem >> y [

	^ self position y
]
