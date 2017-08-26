*Storm-Morphic
buildWindow
	| newWindow |
	
	newWindow := (StandardWindow labelled: self title)
		extent: self dimensions + (0@25);
		yourself.
		
	newWindow 
		addMorph: (surfaceContainer := (ImageMorph new
			image: (Form extent: self dimensions depth: 32)))
		fullFrame: (LayoutFrame 
				fractions: (0@0 corner: 1@1) 
				offsets: (0@0 corner: 0@0)).
		
	newWindow announcer 
		when: WindowClosed do: [ self stop. window := nil ].
		
	^newWindow
		