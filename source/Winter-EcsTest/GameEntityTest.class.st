Class {
	#name : #GameEntityTest,
	#superclass : #TestCase,
	#category : #'Winter-EcsTest-Tests'
}

{ #category : #tests }
GameEntityTest >> testAccessing [

	| entity |

	entity := GameEntity new.

	self assert: entity components isEmpty
]

{ #category : #tests }
GameEntityTest >> testAddComponent [

	| entity component |

	entity := GameEntity new.
	component := Fake1Component new.
	entity addComponent: component.

	self assertCollection: entity components hasSameElements: ( Array with: component )
]

{ #category : #tests }
GameEntityTest >> testComponentOfType [

	| entity component anotherComponent |

	entity := GameEntity new.
	component := Fake1Component new.
	anotherComponent := Fake2Component new.

	entity
		addComponent: component;
		addComponent: anotherComponent.

	self
		assert: ( entity componentOfType: Fake1Component ) equals: component;
		assert: ( entity componentOfType: #Fake1Component ) equals: component;
		assert: ( entity componentOfType: Fake2Component ) equals: anotherComponent;
		assert: ( entity componentOfType: #Fake2Component ) equals: anotherComponent
]

{ #category : #tests }
GameEntityTest >> testHasComponentOfSpecificType [

	| entity component anotherComponent |

	entity := GameEntity new.
	component := Fake1Component new.
	anotherComponent := Fake3Sub1Component new.

	entity
		addComponent: component;
		addComponent: anotherComponent.

	self
		assert: ( entity hasComponentOfSpecificType: Fake1Component );
		assert: ( entity hasComponentOfSpecificType: #Fake1Component );
		deny: ( entity hasComponentOfSpecificType: Fake2Component );
		deny: ( entity hasComponentOfSpecificType: #Fake2Component );
		deny: ( entity hasComponentOfSpecificType: Fake3Component );
		deny: ( entity hasComponentOfSpecificType: #Fake3Component );
		assert: ( entity hasComponentOfSpecificType: Fake3Sub1Component );
		assert: ( entity hasComponentOfSpecificType: #Fake3Sub1Component );
		deny: ( entity hasComponentOfSpecificType: Fake3Sub2Component );
		deny: ( entity hasComponentOfSpecificType: #Fake3Sub2Component )
]

{ #category : #tests }
GameEntityTest >> testHasComponentOfType [

	| entity component anotherComponent |

	entity := GameEntity new.
	component := Fake1Component new.
	anotherComponent := Fake3Sub1Component new.

	entity
		addComponent: component;
		addComponent: anotherComponent.

	self
		assert: ( entity hasComponentOfType: Fake1Component );
		assert: ( entity hasComponentOfType: #Fake1Component );
		deny: ( entity hasComponentOfType: Fake2Component );
		deny: ( entity hasComponentOfType: #Fake2Component );
		assert: ( entity hasComponentOfType: Fake3Component );
		assert: ( entity hasComponentOfType: #Fake3Component );
		assert: ( entity hasComponentOfType: Fake3Sub1Component );
		assert: ( entity hasComponentOfType: #Fake3Sub1Component );
		deny: ( entity hasComponentOfType: Fake3Sub2Component );
		deny: ( entity hasComponentOfType: #Fake3Sub2Component )
]

{ #category : #tests }
GameEntityTest >> testRemoveAllComponents [

	| entity component anotherComponent |

	entity := GameEntity new.
	component := Fake1Component new.
	anotherComponent := Fake2Component new.
	
	entity
		addComponent: component;
		addComponent: anotherComponent.

	self
		assertCollection: entity components
		hasSameElements: ( Array with: component with: anotherComponent ).

	entity removeAllComponents.

	self assert: entity components isEmpty
]

{ #category : #tests }
GameEntityTest >> testRemoveComponent [

	| entity component |

	entity := GameEntity new.
	component := Fake1Component new.

	entity addComponent: component.

	self assertCollection: entity components hasSameElements: ( Array with: component ).

	entity removeComponent: component.

	self assert: entity components isEmpty
]
