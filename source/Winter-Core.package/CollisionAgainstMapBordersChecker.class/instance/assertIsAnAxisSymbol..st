Validating
assertIsAnAxisSymbol: aSymbol
	| symbol |
	symbol := aSymbol asLowercase.
	(#(#x #y) includes: symbol)
		ifFalse: [ Error signal: 'Symbol passed to border checker should be x, X, y or Y' ]