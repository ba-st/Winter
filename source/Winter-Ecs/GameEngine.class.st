Class {
	#name : #GameEngine,
	#superclass : #Object,
	#instVars : [
		'entities',
		'systems'
	],
	#category : #'Winter-Ecs'
}

{ #category : #'Managing - Entities' }
GameEngine >> addEntity: anEntity [

	entities add: anEntity.
	systems do: [ :system | system notifiedOfEngineAddingEntity: anEntity ]
]

{ #category : #'Managing - Systems' }
GameEngine >> addSystem: aSystem [

	systems add: aSystem.
	aSystem addedToEngine: self
]

{ #category : #Creating }
GameEngine >> createComponentOfType: aComponentType [

	| componentClass |

	componentClass := self resolveType: aComponentType.
	^ componentClass new
]

{ #category : #Creating }
GameEngine >> createEntity [

	^ GameEntity new
]

{ #category : #accessing }
GameEngine >> entities [

	^ entities copy
]

{ #category : #Querying }
GameEngine >> entitiesSatisfying: aFilter [

	^ entities select: [ :entity | aFilter isSatisfiedBy: entity ]
]

{ #category : #initialization }
GameEngine >> initialize [

	entities := Set new.
	systems := Set new
]

{ #category : #'Managing - Entities' }
GameEngine >> removeAllEntities [

	entities removeAll
]

{ #category : #'Managing - Entities' }
GameEngine >> removeAllEntitiesSatisfying: aFilter [

	entities removeAllSuchThat: [ :entity | aFilter isSatisfiedBy: entity ]
]

{ #category : #'Managing - Systems' }
GameEngine >> removeAllSystems [

	systems do: [ :system | self removeSystem: system ]
]

{ #category : #'Managing - Entities' }
GameEngine >> removeEntity: anEntity [

	entities remove: anEntity.
	systems do: [ :system | system notifiedOfEngineRemovingEntity: anEntity ]
]

{ #category : #'Managing - Systems' }
GameEngine >> removeSystem: aSystem [

	systems remove: aSystem.
	aSystem removedFromEngine: self
]

{ #category : #Rendering }
GameEngine >> renderUsing: aCanvas [

	systems do: [ :system | system renderUsing: aCanvas ]
]

{ #category : #Support }
GameEngine >> resolveType: aType [

	^ aType isSymbol
		ifTrue: [ Smalltalk at: aType ]
		ifFalse: [ aType ]
]

{ #category : #Querying }
GameEngine >> systemOfType: aSystemType [

	| systemClass |

	systemClass := self resolveType: aSystemType.

	^ systems
		detect: [ :system | system isKindOf: systemClass ]
		ifNone: [ NotFound signal: ( 'No system of type <1s> was added to engine' expandMacrosWith: systemClass printString ) ]
]

{ #category : #accessing }
GameEngine >> systems [

	^ systems copy
]

{ #category : #Updating }
GameEngine >> updateBy: aDeltaTime [

	systems do: [ :system | system updateBy: aDeltaTime ]
]
