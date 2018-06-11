event handling
handleGenericKeyStroke: code
	"key codes for arrows"
	code = 81 ifTrue: [ self downSelection ].
	code = 80 ifTrue: [ self leftSelection ].
	code = 79 ifTrue: [ self rightSelection ].
	code = 82 ifTrue: [ self upSelection ].