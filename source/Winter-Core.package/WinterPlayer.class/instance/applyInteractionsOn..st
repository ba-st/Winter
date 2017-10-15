Interactions
applyInteractionsOn: aWinterWindow
	interactionEvents do: [ :each | each execute: aWinterWindow ]