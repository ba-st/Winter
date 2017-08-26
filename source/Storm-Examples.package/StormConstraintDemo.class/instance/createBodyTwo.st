initialization
createBodyTwo
	| ball |
	ball := self createBall2.
	self currentScene addComponent: (ball).
	^ball physicBody.