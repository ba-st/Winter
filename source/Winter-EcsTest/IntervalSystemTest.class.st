Class {
	#name : #IntervalSystemTest,
	#superclass : #TestCase,
	#category : #'Winter-EcsTest-Tests'
}

{ #category : #Accessing }
IntervalSystemTest >> deltaTime [

	^ 0.1
]

{ #category : #tests }
IntervalSystemTest >> testAccessing [

	| system |

	system := FakeIntervalSystem withIntervalOf: self deltaTime / 2.0.

	self assert: system interval equals: self deltaTime / 2.0.

	system interval: self deltaTime.

	self assert: system interval equals: self deltaTime
]

{ #category : #tests }
IntervalSystemTest >> testUpdateBy [

	| system |

	system := FakeIntervalSystem withIntervalOf: self deltaTime / 2.0.
	1 to: 10 do: [ :i | 
		system updateBy: self deltaTime.
		self assert: system updatesNumber equals: i * 2
		]
]
