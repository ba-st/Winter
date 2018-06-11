reflective operations
doesNotUnderstand: aMessage
	"delegate all not implemented methods to the native asset"

	^ (nativeAsset  respondsTo: aMessage selector)
		ifTrue: [ nativeAsset perform: aMessage selector withEnoughArguments: aMessage arguments ]
		ifFalse: [ super doesNotUnderstand: aMessage ]