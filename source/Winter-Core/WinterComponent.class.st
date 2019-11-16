"
I am the base class for game element that take part in a scene.

Instance Variables
- scene


Public API and Key Messages:

- scene
- scene:

"
Class {
	#name : #WinterComponent,
	#superclass : #WinterReactiveObject,
	#instVars : [
		'scene'
	],
	#category : #'Winter-Core-Base'
}

{ #category : #accessing }
WinterComponent >> scene [

	^ scene
]

{ #category : #accessing }
WinterComponent >> scene: anObject [

	scene := anObject
]
