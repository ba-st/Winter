Class {
	#name : #GameEntity,
	#superclass : #Object,
	#instVars : [
		'components'
	],
	#category : #'Winter-Ecs'
}

{ #category : #'Managing - Components' }
GameEntity >> addComponent: aComponent [

	components add: aComponent
]

{ #category : #'Managing - Components' }
GameEntity >> componentOfType: aType [

	| type |

	type := self resolveType: aType.

	^ components
		detect: [ :component | component isKindOf: type ]
		ifNone: [ NotFound
				signal: ( 'Entity does not have component of type <1s>' expandMacrosWith: type printString )
			]
]

{ #category : #Accessing }
GameEntity >> components [

	^ components copy
]

{ #category : #Testing }
GameEntity >> hasComponentOfSpecificType: aType [

	| type |

	type := self resolveType: aType.

	^ components anySatisfy: [ :component | component isOfType:type ]
]

{ #category : #Testing }
GameEntity >> hasComponentOfType: aType [

	| type |

	type := self resolveType: aType.

	^ components anySatisfy: [ :component | component isKindOf: type ]
]

{ #category : #initialization }
GameEntity >> initialize [

	super initialize.
	components := Set new
]

{ #category : #'Managing - Components' }
GameEntity >> removeAllComponents [

	components removeAll
]

{ #category : #'Managing - Components' }
GameEntity >> removeComponent: aComponent [

	components remove: aComponent
]

{ #category : #private }
GameEntity >> resolveType: aType [

	^ aType isSymbol
		ifTrue: [ Smalltalk at: aType ]
		ifFalse: [ aType ]
]
