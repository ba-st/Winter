examples
example1
	"This is the hello, world example from http://chipmunk-physics.net/release/ChipmunkLatest-Docs/
	
	self example1 "
	| space ground mass moment ballBody ballShape timeStep time |

	space := CmSpace new
		gravity: 0@ -100;
		yourself.

	ground := CmShape 
		newSegmentBody: space staticBody 
			from: -20@5
			to: 20@ -5
			radius: 0.
	ground friction: 1.0.
	space addShape: ground.

	mass := 1.0.
	moment := ChipmunkLibrary 
		momentForCircleWithMass: mass 
		innerRadius: 0.0 
		outerRadius: 5.0 
		offset: 0@0.
	ballBody := CmBody newMass: mass moment: moment.
	space addBody: ballBody.
	ballBody position: 0@15.

	ballShape := CmShape 
		newCircleBody: ballBody 
		radius: 5 
		offset: 0@0.
	ballShape friction: 0.7.
	space addShape: ballShape.

	timeStep := (1/60) asFloat.
	time := 0.
	[ time < 2 ] whileTrue: [
	 	| pos vel |	
		
		pos := ballBody position.
	    	vel := ballBody velocity.
		
		Transcript 
			show: ('Time is {1}. ballBody is at ({2}, {3}). It''s velocity is ({4}, {5})'
				format: {time. pos x. pos y. vel x. vel y});
			cr.
		
		space step: timeStep.
		time := time + timeStep ].
