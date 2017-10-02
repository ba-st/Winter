private
createBallShape
	^WinterBallShape new
		radius: 6 + (9 atRandom);
		color: Color random;
		yourself