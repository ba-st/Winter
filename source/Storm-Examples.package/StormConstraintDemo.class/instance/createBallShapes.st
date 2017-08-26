initialization
createBallShapes
	^{StormBallShape new color: Color random;
		position: 10@10;radius: 10;
		yourself. 
		StormBallShape new color: Color random;
		position: 50@10; radius: 10;
		yourself.}