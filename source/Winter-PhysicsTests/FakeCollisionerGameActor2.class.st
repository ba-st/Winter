Class {
	#name : #FakeCollisionerGameActor2,
	#superclass : #GameActor,
	#category : #'Winter-PhysicsTests'
}

{ #category : #Accessing }
FakeCollisionerGameActor2 >> collisionShape [

	^ 1 @ 1 extent: 4 @ 4
]

{ #category : #accessing }
FakeCollisionerGameActor2 >> position [

	^ self collisionShape origin
]
