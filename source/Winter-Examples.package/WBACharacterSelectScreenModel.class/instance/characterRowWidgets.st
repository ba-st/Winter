Screen Building
characterRowWidgets
	^ #(0 192) flatCollect: [ :y |
		#(0 96 192 288) collect: [ :x |
			self newCharacterRowWidget: x @ y ] ]