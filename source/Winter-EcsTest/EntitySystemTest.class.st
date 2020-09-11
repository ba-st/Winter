Class {
	#name : #EntitySystemTest,
	#superclass : #TestCase,
	#category : #'Winter-EcsTest-Tests'
}

{ #category : #Accessing }
EntitySystemTest >> deltaTime [

	^ 0.1
]

{ #category : #tests }
EntitySystemTest >> testUpdateBy [

	| system |

	system := FakeEntitySystem new.
	1 to: 10 do: [ :i | 
		system updateBy: self deltaTime.
		self assert: system updatesNumber equals: i
		]
]
