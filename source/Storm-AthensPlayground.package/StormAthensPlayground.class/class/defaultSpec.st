specs
defaultSpec
	<spec>
		
	^SpecLayout composed 	
		newColumn: [ :c |
			c
				newRow: [ :r | r add: #startButton width: 50 ] height: 25;
				newRow: [ :r | r add: #playground ] ]