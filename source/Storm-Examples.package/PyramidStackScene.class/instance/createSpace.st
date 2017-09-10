private
createSpace
	^ CmSpace new
		iterations: 30;
		gravity: 0 @ 100 negated;
		sleepTimeThereshold: 0.5;
		collisionSlop: 0.5;
		yourself