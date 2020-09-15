Class {
	#name : #FakeCollisionerGameActor1,
	#superclass : #GameActor,
	#category : #'Winter-PhysicsTests'
}

{ #category : #Accessing }
FakeCollisionerGameActor1 >> collisionShape [

	^ 0 @ 0 extent: 5 @ 5
]

{ #category : #accessing }
FakeCollisionerGameActor1 >> position [

	^ self collisionShape origin
]
