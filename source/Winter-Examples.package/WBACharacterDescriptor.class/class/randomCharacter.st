accessing
randomCharacter
	^ self new
		fileName: 'perso' , 13 atRandom printString;
		position: #(0 96 192 288) atRandom @ #(0 192) atRandom ;
		yourself