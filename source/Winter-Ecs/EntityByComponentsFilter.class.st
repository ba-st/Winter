Class {
	#name : #EntityByComponentsFilter,
	#superclass : #Object,
	#instVars : [
		'allInclusionSet',
		'anyInclusionSet',
		'allExcludedSet'
	],
	#category : #'Winter-Ecs'
}

{ #category : #Evaluating }
EntityByComponentsFilter >> allInclusionSatisfiedBy: componentsTypes [

	^ allInclusionSet isEmpty
		or: [ allInclusionSet allSatisfy: [ :componentType | componentsTypes includes: componentType ] ]
]

{ #category : #Configuring }
EntityByComponentsFilter >> allOf: aComponentsTypesCollection [

	allInclusionSet addAll: aComponentsTypesCollection
]

{ #category : #Evaluating }
EntityByComponentsFilter >> anyInclusionSatisfiedBy: componentsTypes [

	^ anyInclusionSet isEmpty
		or: [ anyInclusionSet anySatisfy: [ :componentType | componentsTypes includes: componentType ] ]
]

{ #category : #Configuring }
EntityByComponentsFilter >> anyOf: aComponentsTypesCollection [

	anyInclusionSet addAll: aComponentsTypesCollection
]

{ #category : #Configuring }
EntityByComponentsFilter >> excludeAllOf: aComponentsTypesCollection [

	allExcludedSet addAll: aComponentsTypesCollection
]

{ #category : #Evaluating }
EntityByComponentsFilter >> exclusionSatisfiedBy: componentsTypes [

	^ allExcludedSet isEmpty
		or: [ allExcludedSet noneSatisfy: [ :componentType | componentsTypes includes: componentType ] ]
]

{ #category : #initialization }
EntityByComponentsFilter >> initialize [

	allInclusionSet := Set new.
	anyInclusionSet := Set new.
	allExcludedSet := Set new
]

{ #category : #Evaluating }
EntityByComponentsFilter >> isSatisfiedBy: anEntity [

	| componentsTypes |

	componentsTypes := anEntity components collect: [ :component | component class ].


	^ ( self allInclusionSatisfiedBy: componentsTypes )
		and: [ ( self anyInclusionSatisfiedBy: componentsTypes )
				and: [ self exclusionSatisfiedBy: componentsTypes ]
			]
]
