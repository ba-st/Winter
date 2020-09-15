Class {
	#name : #FakeCollisionerGameActor3,
	#superclass : #GameActor,
	#category : #'Winter-PhysicsTests'
}

{ #category : #Accessing }
FakeCollisionerGameActor3 >> collisionShape [

	^ 6 @ 6 extent: 8 @ 8
]

{ #category : #accessing }
FakeCollisionerGameActor3 >> position [

	^ self collisionShape origin
]
