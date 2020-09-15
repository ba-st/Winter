Class {
	#name : #CollisionHandlerTest,
	#superclass : #TestCase,
	#category : #'Winter-PhysicsTests'
}

{ #category : #tests }
CollisionHandlerTest >> testCanHandle [

	| handler collision1 collision2 |

	handler := CollisionHandler
		between: FakeCollisionerGameActor1
		and: FakeCollisionerGameActor2
		onCollisionDo: [  ].
		
	collision1 := CollisionOcurred
		between: FakeCollisionerGameActor1 new
		and: FakeCollisionerGameActor2 new.
		
	collision2 := CollisionOcurred
		between: FakeCollisionerGameActor1 new
		and: FakeCollisionerGameActor3 new.

	self
		assert: ( handler canHandle: collision1 );
		deny: ( handler canHandle: collision2 )
]

{ #category : #tests }
CollisionHandlerTest >> testHandle [

	| handler collision |

	handler := CollisionHandler
		between: FakeCollisionerGameActor1
		and: FakeCollisionerGameActor2
		onCollisionDo: [ true ].

	collision := CollisionOcurred
		between: FakeCollisionerGameActor1 new
		and: FakeCollisionerGameActor2 new.

	self assert: ( handler handle: collision )
]

{ #category : #tests }
CollisionHandlerTest >> testHandleAnd [

	| handler collision |

	handler := CollisionHandler
		between: FakeCollisionerGameActor1
		and: FakeCollisionerGameActor2
		onCollisionDo: [ true ].

	collision := CollisionOcurred
		between: FakeCollisionerGameActor1 new
		and: FakeCollisionerGameActor2 new.

	self assert: ( handler handle: collision firstComponent and: collision secondComponent )
]

{ #category : #tests }
CollisionHandlerTest >> testPrinting [

	| handler |

	handler := CollisionHandler
		between: FakeCollisionerGameActor1
		and: FakeCollisionerGameActor2
		onCollisionDo: [  ].

	self
		assert: handler printString
		equals:
			( 'Collission handler for type of: <1s> and type of: <2>'
				expandMacrosWith: FakeCollisionerGameActor1 printString
				with: FakeCollisionerGameActor2 printString )
]
