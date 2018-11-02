Class {
	#name : #WinterTiledMapRendererTest,
	#superclass : #TestCase,
	#instVars : [
		'map',
		'receivedUpdateEvent'
	],
	#category : 'Winter-TiledTests'
}

{ #category : #'Test SUpport' }
WinterTiledMapRendererTest >> eventActivated: aWinterSceneActivated [ 

	receivedActivateEvent := true
]

{ #category : #'Test SUpport' }
WinterTiledMapRendererTest >> eventUpdated: aWinterSceneUpdated [ 
	
	receivedUpdateEvent := true.
]

{ #category : #'Test SUpport' }
WinterTiledMapRendererTest >> layer [

	^self
]

{ #category : #initialization }
WinterTiledMapRendererTest >> setUp [

	map := WinterTiledMap new.
	receivedUpdateEvent := false.
	receivedActivateEvent := false.
]

{ #category : #tests }
WinterTiledMapRendererTest >> testAccessing [

	|renderer |

	renderer := WinterTiledMapRenderer of: map .

	self
		assert: renderer map equals: map;
		assert: renderer unitScale equals: 1.0.

	renderer unitScale: 2.0.

	self assert: renderer unitScale equals: 2.0
]
