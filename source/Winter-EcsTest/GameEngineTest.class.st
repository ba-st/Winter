Class {
	#name : #GameEngineTest,
	#superclass : #TestCase,
	#category : #'Winter-EcsTest-Tests'
}

{ #category : #Accessing }
GameEngineTest >> deltaTime [

	^ 0.1
]

{ #category : #Tests }
GameEngineTest >> testAccessing [

	| engine |

	engine := GameEngine new.
	
	self
		assert: engine entities isEmpty;
		assert: engine systems isEmpty
]

{ #category : #'Tests - Managing Entities' }
GameEngineTest >> testAddEntity [

	| engine entity |

	engine := GameEngine new.
	entity := engine createEntity.

	self assert: engine entities isEmpty.

	engine addEntity: entity.

	self
		assert: engine entities notEmpty;
		assert: ( engine entities includes: entity )
]

{ #category : #'Tests - Managing Systems' }
GameEngineTest >> testAddEntityWillAddEntityToSystemsInterestedInThatEntity [

	| engine system filter entity1 entity2 |

	engine := GameEngine new.
	entity1 := engine createEntity.
	entity2 := engine createEntity.
	entity1 addComponent: Fake1Component new.

	filter := EntityByComponentsFilter new.
	filter allOf: ( Array with: Fake1Component ).
	system := FakeEntityProcessingSystem filteringWith: filter.

	self
		assert: system entities isEmpty;
		assert: engine entities isEmpty;
		assert: engine systems isEmpty.

	engine addSystem: system.

	self
		assert: engine systems notEmpty;
		assert: engine entities isEmpty;
		assert: system entities isEmpty.

	engine
		addEntity: entity1;
		addEntity: entity2.

	self
		assert: engine systems notEmpty;
		assert: engine entities notEmpty;
		assert: system entities notEmpty;
		assert: ( engine entities includes: entity1 );
		assert: ( engine entities includes: entity2 );
		assert: ( system entities includes: entity1 )
]

{ #category : #'Tests - Managing Systems' }
GameEngineTest >> testAddSystem [

	| engine system |

	engine := GameEngine new.
	system := FakeEntitySystem new.

	self
		assert: engine systems isEmpty;
		deny: system addedToEngine.

	engine addSystem: system.

	self
		assert: engine systems notEmpty;
		assert: ( engine systems includes: system );
		assert: system addedToEngine
]

{ #category : #'Tests - Managing Systems' }
GameEngineTest >> testAddSystemThatProcessEntitiesWillAddEntitiesSatisfyingFilterToTheSystem [

	| engine system filter entity1 entity2 |

	engine := GameEngine new.
	entity1 := engine createEntity.
	entity2 := engine createEntity.
	entity1 addComponent: Fake1Component new.

	filter := EntityByComponentsFilter new.
	filter allOf: ( Array with: Fake1Component ).
	system := FakeEntityProcessingSystem filteringWith: filter.

	self
		assert: system entities isEmpty;
		assert: engine entities isEmpty;
		assert: engine systems isEmpty.

	engine
		addEntity: entity1;
		addEntity: entity2;
		addSystem: system.

	self
		assert: engine systems notEmpty;
		assert: engine entities notEmpty;
		assert: engine entities size equals: 2;
		assert: system entities notEmpty;
		assert: system entities size equals: 1;
		assert: ( system entities includes: entity1 );
		deny: ( system entities includes: entity2 )
]

{ #category : #'Tests - Creating' }
GameEngineTest >> testCreateComponentOfType [

	| engine component1 component2 type1 type2 |

	engine := GameEngine new.
	type1 := Fake1Component.
	type2 := #Fake1Component.

	component1 := engine createComponentOfType: type1.
	component2 := engine createComponentOfType: type2.

	self
		assert: ( component1 isOfType: type1 );
		assert: ( component2 isOfType: type1 )
]

{ #category : #'Tests - Creating' }
GameEngineTest >> testCreateEntity [

	| engine entity |

	engine := GameEngine new.
	entity := engine createEntity.

	self assert: entity class equals: GameEntity
]

{ #category : #'Tests - Managing Entities' }
GameEngineTest >> testEntitiesSatisfying [

	| engine entity1 entity2 filter entities |

	engine := GameEngine new.
	entity1 := engine createEntity.
	entity2 := engine createEntity.
	filter := EntityByComponentsFilter new.

	filter excludeAllOf: ( Array with: Fake1Component ).
	entity1 addComponent: Fake1Component new.

	engine
		addEntity: entity1;
		addEntity: entity2.

	self assert: engine entities size equals: 2.

	entities := engine entitiesSatisfying: filter.

	self
		assert: entities size equals: 1;
		assert: ( entities includes: entity2 )
]

{ #category : #'Tests - Managing Entities' }
GameEngineTest >> testRemoveAllEntities [

	| engine |

	engine := GameEngine new.

	3 timesRepeat: [ engine addEntity: engine createEntity ].

	self assert: engine entities size equals: 3.

	engine removeAllEntities.

	self assert: engine entities isEmpty
]

{ #category : #'Tests - Managing Entities' }
GameEngineTest >> testRemoveAllEntitiesSatisfying [

	| engine entity1 entity2 filter |

	engine := GameEngine new.
	entity1 := engine createEntity.
	entity2 := engine createEntity.
	filter := EntityByComponentsFilter new.

	filter excludeAllOf: ( Array with: Fake1Component ).
	entity1 addComponent: Fake1Component new.

	engine
		addEntity: entity1;
		addEntity: entity2.

	self assert: engine entities size equals: 2.

	engine removeAllEntitiesSatisfying: filter.

	self
		assert: engine entities size equals: 1;
		deny: ( engine entities includes: entity2 );
		assert: ( engine entities includes: entity1 )
]

{ #category : #'Tests - Managing Systems' }
GameEngineTest >> testRemoveAllSystems [

	| engine system anotherSystem |

	engine := GameEngine new.
	system := FakeEntitySystem new.
	anotherSystem := FakeEntitySystem new.

	engine
		addSystem: system;
		addSystem: anotherSystem.

	self
		assert: engine systems notEmpty;
		assert: system addedToEngine;
		assert: anotherSystem addedToEngine.

	engine removeAllSystems.

	self
		assert: engine systems isEmpty;
		deny: system addedToEngine;
		deny: anotherSystem addedToEngine
]

{ #category : #'Tests - Managing Entities' }
GameEngineTest >> testRemoveEntity [

	| engine entity |

	engine := GameEngine new.
	entity := engine createEntity.

	self assert: engine entities isEmpty.

	engine addEntity: entity.

	self
		assert: engine entities notEmpty;
		assert: ( engine entities includes: entity ).

	engine removeEntity: entity.

	self
		assert: engine entities isEmpty;
		deny: ( engine entities includes: entity )
]

{ #category : #'Tests - Managing Systems' }
GameEngineTest >> testRemoveSystem [

	| engine system |

	engine := GameEngine new.
	system := FakeEntitySystem new.

	engine addSystem: system.

	self
		assert: engine systems notEmpty;
		assert: ( engine systems includes: system );
		assert: system addedToEngine.

	engine removeSystem: system.

	self
		assert: engine systems isEmpty;
		deny: system addedToEngine
]

{ #category : #'Tests - Managing Systems' }
GameEngineTest >> testRemoveSystemThatProcessEntitiesWillRemoveAllEntitiesFromTheSystem [

	| engine system filter entity1 entity2 |

	engine := GameEngine new.
	entity1 := engine createEntity.
	entity2 := engine createEntity.
	entity1 addComponent: Fake1Component new.

	filter := EntityByComponentsFilter new.
	filter allOf: ( Array with: Fake1Component ).
	system := FakeEntityProcessingSystem filteringWith: filter.

	self
		assert: system entities isEmpty;
		assert: engine entities isEmpty;
		assert: engine systems isEmpty.

	engine
		addEntity: entity1;
		addEntity: entity2;
		addSystem: system.

	self
		assert: engine entities notEmpty;
		assert: engine entities size equals: 2;
		assert: system entities notEmpty;
		assert: system entities size equals: 1.

	engine removeSystem: system.

	self
		assert: engine entities notEmpty;
		assert: engine entities size equals: 2;
		assert: system entities isEmpty
]

{ #category : #'Tests - Managing Systems' }
GameEngineTest >> testSystemOfType [

	| engine system anotherSystem |

	engine := GameEngine new.
	system := FakeEntitySystem new.

	engine addSystem: system.

	self
		assert: ( engine systemOfType: FakeEntitySystem ) equals: system;
		assert: ( engine systemOfType: #FakeEntitySystem ) equals: system.

	self
		should: [ engine systemOfType: FakeIntervalSystem ]
		raise: NotFound
		withExceptionDo: [ :ex | 
			self
				assert: ex messageText
				equals: ( 'No system of type <1s> was added to engine' expandMacrosWith: FakeIntervalSystem printString )
			]
]

{ #category : #Tests }
GameEngineTest >> testUpdateBy [

	| engine system anotherSystem |

	engine := GameEngine new.
	system := FakeEntitySystem new.
	anotherSystem := FakeIntervalSystem withIntervalOf: self deltaTime / 2.0.

	engine
		addSystem: system;
		addSystem: anotherSystem.

	1 to: 10 do: [ :i | 
		engine updateBy: self deltaTime.
		self
			assert: system updatesNumber equals: i;
			assert: anotherSystem updatesNumber equals: i * 2
		]
]
