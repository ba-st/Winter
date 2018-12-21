"
Exception for asset not found
"
Class {
	#name : #AssetNotFound,
	#superclass : #Error,
	#category : #'Winter-AssetManagement'
}

{ #category : #Signaling }
AssetNotFound class >> signalNamed: aName [
	self
		signal:
			'Asset named ' , aName
				, ' does not exist in Asset System'
]
