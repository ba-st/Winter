defaults
for: aContraint
	| inst |
	inst := self new.
	inst constraint: aContraint specialize.
	^inst 