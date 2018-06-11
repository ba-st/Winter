actions
fire

	| missilePos |

	loaded
		ifTrue: [ loaded := false.
			missilePos := self position - (0 @ 24).
			scene addComponent: (SpiderInvasionMissile atPosition: missilePos of: scene tick: 5) ]