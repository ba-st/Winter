"
I am an abstract class for all non player components in the spider invasion scene

Public API and Key Messages:

- die
- isEmpty
- spriteSize
- translation
- x
- y
"
Class {
	#name : #SpiderInvasionItem,
	#superclass : #WinterMovableComponent,
	#category : #'Winter-Examples-SpiderInvasion'
}

{ #category : #Actions }
SpiderInvasionItem >> die [

	game removeComponent: self
]

{ #category : #Testing }
SpiderInvasionItem >> isEmpty [

	^ false
]

{ #category : #Accessing }
SpiderInvasionItem >> spriteSize [

	^ 48 @ 48
]

{ #category : #Accessing }
SpiderInvasionItem >> translation [

	"Sprites of 48x48."

	^ ( self position - ( 1 @ 1 ) ) * self spriteSize
]

{ #category : #Accessing }
SpiderInvasionItem >> x [

	^ self position x
]

{ #category : #Accessing }
SpiderInvasionItem >> y [

	^ self position y
]
