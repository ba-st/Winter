Class {
	#name : #WinterAsset,
	#superclass : #Object,
	#instVars : [
		'path',
		'nativeAsset',
		'name'
	],
	#category : 'Winter-AssetManagement'
}

{ #category : #'Instance Creation' }
WinterAsset class >> fromPath: aStringPath named: aName [

	self subclassResponsibility
]

{ #category : #'reflective operations' }
WinterAsset >> doesNotUnderstand: aMessage [
	"delegate all not implemented methods to the native asset"

	^ (nativeAsset  respondsTo: aMessage selector)
		ifTrue: [ nativeAsset perform: aMessage selector withEnoughArguments: aMessage arguments ]
		ifFalse: [ super doesNotUnderstand: aMessage ]
]

{ #category : #accessing }
WinterAsset >> name [

	^ name
]

{ #category : #accessing }
WinterAsset >> path [

	^ path
]
