initialization
createBodyOne
	| ball |
	ball := self createBall1.
	self currentScene addComponent: (ball).
	^ball physicBody.