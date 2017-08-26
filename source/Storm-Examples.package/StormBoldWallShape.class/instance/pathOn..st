drawing
pathOn: aCanvas
	^ aCanvas createPath: [ :builder |
		builder 
			relative;
			moveTo: self position;
			lineTo: self extent";
			lineTo: self extent x negated @ 0;
			close" ]