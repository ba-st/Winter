accessing
backgroundAt: i
	^ self new
		fileName: 'terrain';
		position: (#(0 48 96 144 192 240) at: i) @ 0 ;
		yourself