Class {
	#name : #SpiderInvasionEmpty,
	#superclass : #SpiderInvasionItem,
	#category : 'Winter-Examples-SpiderInvasion'
}

{ #category : #Testing }
SpiderInvasionEmpty >> isEmpty [

	^ true
]

{ #category : #Collision }
SpiderInvasionEmpty >> missileEnter: missile [

	game scene itemAt: self position  put: missile .
	missile position: self position
]

{ #category : #Rendering }
SpiderInvasionEmpty >> renderOn: aCanvas [
]

{ #category : #Collision }
SpiderInvasionEmpty >> spiderEnter: spider [

	game scene itemAt: self position  put: spider .
	spider position: self position
]
