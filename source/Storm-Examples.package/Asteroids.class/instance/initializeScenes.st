initialization
initializeScenes
	self addScene: (Storm2DScene new
		addComponents: ((1 to: 1) collect: [ :index | 
			 AsteroidRockShape new
				speed: 4;
				position: 0@((100 * index) - 50);
				yourself ]); 
		yourself).