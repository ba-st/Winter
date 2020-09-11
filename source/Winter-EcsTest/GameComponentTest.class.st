Class {
	#name : #GameComponentTest,
	#superclass : #TestCase,
	#category : #'Winter-EcsTest-Tests'
}

{ #category : #tests }
GameComponentTest >> testType [

	"This is not a very usefull test but i want all to be covered"

	self assert: ( Fake1Component new isOfType: Fake1Component )
]
