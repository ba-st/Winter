as yet unclassified
castFrom: character
	| sp |
	self onCD ifTrue: [ ^ self ].
	self updateSpellCD.
	character cell spells add: (sp := WBACastedSpell new
		direction: character direction;
		character: character;
		sprites: sprites;
		scheduler: scheduler;
		cell: character cell;
		yourself).
	sp startAnimation.