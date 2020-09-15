Class {
	#name : #CollisionsTest,
	#superclass : #TestCase,
	#category : #'Winter-PhysicsTests'
}

{ #category : #support }
CollisionsTest >> extent [

	^ 5 @ 0
]

{ #category : #support }
CollisionsTest >> position [

	^ 0 @ 0
]

{ #category : #support }
CollisionsTest >> screen [

	^ self
]

{ #category : #tests }
CollisionsTest >> testCollisionOcurredBetweenActorAndAxis [

	| checker actor |

	checker := CollisionChecker new.
	actor := FakeCollisionerGameActor3 new.

	self
		should: [ checker checkFor: actor and: self onAxis: #x ]
		raise: CollisionOcurred
		withExceptionDo: [ :collision | self assert: collision messageText equals: 'A collision ocurred' ].
	self
		should: [ checker checkFor: actor and: self onAxis: #y ]
		raise: CollisionOcurred
		withExceptionDo: [ :collision | self assert: collision messageText equals: 'A collision ocurred' ]
]

{ #category : #tests }
CollisionsTest >> testCollisionOcurredBetweenTwoActors [

	| checker actor1 actor2 |

	checker := CollisionChecker new.
	actor1 := FakeCollisionerGameActor1 new.
	actor2 := FakeCollisionerGameActor2 new.

	self
		should: [ checker checkFor: actor1 and: actor2 ]
			raise: CollisionOcurred
			withExceptionDo: [ :collision | self assert: collision messageText equals: 'A collision ocurred' ];
		should: [ checker checkFor: actor2 and: actor1 ]
			raise: CollisionOcurred
			withExceptionDo: [ :collision | self assert: collision messageText equals: 'A collision ocurred' ]
]

{ #category : #tests }
CollisionsTest >> testErrorWhileTryingToCheckCollisionBetweenActorAndInexistentAxis [

	| checker actor |

	checker := CollisionChecker new.
	actor := FakeCollisionerGameActor1 new.

	self
		should: [ checker checkFor: actor and: self onAxis: #z ]
			raise: AssertionFailed
			withExceptionDo:
				[ :exception | self assert: exception messageText equals: 'Symbol passed to border checker should be x, X, y or Y' ];
		should: [ checker checkFor: actor and: self onAxis: #abc ]
			raise: AssertionFailed
			withExceptionDo:
				[ :exception | self assert: exception messageText equals: 'Symbol passed to border checker should be x, X, y or Y' ];
		should: [ checker checkFor: actor and: self onAxis: #helloWorld ]
			raise: AssertionFailed
			withExceptionDo:
				[ :exception | self assert: exception messageText equals: 'Symbol passed to border checker should be x, X, y or Y' ]
]

{ #category : #tests }
CollisionsTest >> testNoCollisionOcurredBetweenActorAndAxis [

	| checker actor1 actor2 |

	checker := CollisionChecker new.
	actor1 := FakeCollisionerGameActor1 new.
	actor2 := FakeCollisionerGameActor2 new.

	self
		shouldnt: [ checker checkFor: actor1 and: self onAxis: #x ] raise: CollisionOcurred;
		shouldnt: [ checker checkFor: actor2 and: self onAxis: #x ] raise: CollisionOcurred;
		shouldnt: [ checker checkFor: actor1 and: self onAxis: #y ] raise: CollisionOcurred
]

{ #category : #tests }
CollisionsTest >> testNoCollisionOcurredBetweenTwoActors [

	| checker actor1 actor2 actor3 |

	checker := CollisionChecker new.
	actor1 := FakeCollisionerGameActor1 new.
	actor2 := FakeCollisionerGameActor2 new.
	actor3 := FakeCollisionerGameActor3 new.

	self
		shouldnt: [ checker checkFor: actor1 and: actor3 ] raise: CollisionOcurred;
		shouldnt: [ checker checkFor: actor2 and: actor3 ] raise: CollisionOcurred
]
