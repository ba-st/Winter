initialization
initializeComponents

	self
		addComponent: ArkanoidBall new;
		addComponent: (ArkanoidWall ofCenter: 0 @ 0 extent: 626 @ 0 andColor: Color white);
		addComponent: (ArkanoidWall ofCenter: 0 @ 0 extent: 0 @ 600 andColor: Color white);
		addComponent: (ArkanoidWall ofCenter: 600 @ 0 extent: 0 @ 600 andColor: Color white);
		addComponent: (ArkanoidBlock yellowOn: 150 @ 150 ofExtent: 50 @ 25 );
		addComponent: (ArkanoidBlock greenOn: 210 @ 150 ofExtent: 50 @ 25 );
		addComponent: (ArkanoidBlock redOn: 90 @ 150 ofExtent: 50 @ 25 )
		
		