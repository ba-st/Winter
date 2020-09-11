Class {
	#name : #EntityByComponentsFilterTest,
	#superclass : #TestCase,
	#category : #'Winter-EcsTest-Tests'
}

{ #category : #tests }
EntityByComponentsFilterTest >> testAllExclusion [

	| filter entity1 entity2 entity3 component1 component2 component3 |

	component1 := Fake1Component new.
	component2 := Fake2Component new.
	component3 := Fake3Component new.

	entity1 := GameEntity new.
	entity2 := GameEntity new.
	entity3 := GameEntity new.

	entity1 addComponent: component1.

	entity2 addComponent: component3.

	entity3
		addComponent: component2;
		addComponent: component3.

	filter := EntityByComponentsFilter new.
	filter excludeAllOf: ( Array with: Fake2Component with: Fake3Component ).

	self
		assert: ( filter isSatisfiedBy: entity1 );
		deny: ( filter isSatisfiedBy: entity2 );
		deny: ( filter isSatisfiedBy: entity3 )
]

{ #category : #tests }
EntityByComponentsFilterTest >> testAllInclusion [

	| filter entity1 entity2 entity3 component1 component2 component3 |

	component1 := Fake1Component new.
	component2 := Fake2Component new.
	component3 := Fake3Component new.

	entity1 := GameEntity  new.
	entity2 := GameEntity new.
	entity3 := GameEntity new.

	entity1 addComponent: component1.

	entity2
		addComponent: component1;
		addComponent: component2.

	entity3
		addComponent: component1;
		addComponent: component2;
		addComponent: component3.

	filter := EntityByComponentsFilter new.
	filter allOf: ( Array with: Fake1Component with: Fake2Component ).

	self
		deny: ( filter isSatisfiedBy: entity1 );
		assert: ( filter isSatisfiedBy: entity2 );
		assert: ( filter isSatisfiedBy: entity3 )
]

{ #category : #tests }
EntityByComponentsFilterTest >> testAnyInclusion [

	| filter entity1 entity2 entity3 component1 component2 component3 |

	component1 := Fake1Component new.
	component2 := Fake2Component new.
	component3 := Fake3Component new.

	entity1 := GameEntity new.
	entity2 := GameEntity new.
	entity3 := GameEntity new.

	entity1 addComponent: component1.

	entity2 addComponent: component3.

	entity3
		addComponent: component2;
		addComponent: component3.

	filter := EntityByComponentsFilter new.
	filter anyOf: ( Array with: Fake1Component with: Fake2Component ).

	self
		assert: ( filter isSatisfiedBy: entity1 );
		deny: ( filter isSatisfiedBy: entity2 );
		assert: ( filter isSatisfiedBy: entity3 )
]

{ #category : #tests }
EntityByComponentsFilterTest >> testMixedInclusionAndExclusion [

	| filter entity1 entity2 entity3 entity4 component1 component2 component3 component4 |

	component1 := Fake1Component new.
	component2 := Fake2Component new.
	component3 := Fake3Sub1Component new.
	component4 := Fake3Sub2Component new.

	entity1 := GameEntity new.
	entity2 := GameEntity new.
	entity3 := GameEntity new.
	entity4 := GameEntity new.

	entity1
		addComponent: component1;
		addComponent: component3.

	entity2
		addComponent: component3;
		addComponent: component4.

	entity3
		addComponent: component1;
		addComponent: component4.
	entity4
		addComponent: component1;
		addComponent: component2;
		addComponent: component3.

	filter := EntityByComponentsFilter new.
	filter allOf: ( Array with: Fake1Component ).
	filter anyOf: ( Array with: Fake3Sub1Component with: Fake3Sub2Component ).
	filter excludeAllOf: ( Array with: Fake2Component ).

	self
		assert: ( filter isSatisfiedBy: entity1 );
		deny: ( filter isSatisfiedBy: entity2 );
		assert: ( filter isSatisfiedBy: entity3 );
		deny: ( filter isSatisfiedBy: entity4 )
]
