private
createBallShape
	^StormBallShape new
		radius: 6 + (9 atRandom);
		color: Color random;
		yourself