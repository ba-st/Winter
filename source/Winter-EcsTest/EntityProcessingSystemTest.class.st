Class {
	#name : #EntityProcessingSystemTest,
	#superclass : #TestCase,
	#category : #'Winter-EcsTest-Tests'
}

{ #category : #Accessing }
EntityProcessingSystemTest >> deltaTime [

	^ 0.1
]

{ #category : #Accessing }
EntityProcessingSystemTest >> filter [

	^ EntityByComponentsFilter new
]

{ #category : #tests }
EntityProcessingSystemTest >> testAccessing [

	| filter system |

	filter := self filter.
	system := FakeEntityProcessingSystem filteringWith: filter.

	self
		assert: system entities isEmpty;
		assert: system filter equals: filter
]

{ #category : #tests }
EntityProcessingSystemTest >> testUpdateBy [

	| engine system entity1 entity2 |

	engine := GameEngine new.
	system := FakeEntityProcessingSystem filteringWith: self filter.
	entity1 := GameEntity new.
	entity2 := GameEntity new.
	engine
		addEntity: entity1;
		addEntity: entity2;
		addSystem: system.

	1 to: 10 do: [ :i | 
		system updateBy: self deltaTime.
		self assert: system updatesNumber equals: i.
		self
			assert: ( system updatesNumberForEntity: entity1 ) equals: i;
			assert: ( system updatesNumberForEntity: entity2 ) equals: i
		]
]
