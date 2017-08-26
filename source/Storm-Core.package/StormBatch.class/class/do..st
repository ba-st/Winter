instance creation
do: aBlock
	^self new
		batch: aBlock;
		yourself