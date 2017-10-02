instance creation
newFor: aExternalConstraint 
	| inst |
	inst := self basicNew initialize.
	inst handle:  aExternalConstraint handle.
	^inst