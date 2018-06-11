accessing
randomBackground
	^ self new
		fileName: 'terrain';
		position: #(0 48 96 144 192 240) atRandom @ 0 ;
		yourself