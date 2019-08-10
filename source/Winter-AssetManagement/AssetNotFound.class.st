"
I represent a Signal of a not found asset.

I am fired when an Asset is not found in the desire path.



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
