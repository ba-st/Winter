opening
openWith: aPainter
	| surfaceContainer |
	
	self
		addMorph: (surfaceContainer := (ImageMorph new
			image: (Form extent: self extent depth: 32)))
		fullFrame: (LayoutFrame 
				fractions: (0@0 corner: 1@1) 
				offsets: (0@0 corner: 0@0)).
		
	self announcer 
		when: WindowClosed do: [ aPainter stop ].
	
	surface := AthensCairoSurface extent: self extent.
	self openAsIs.
	aPainter container: surfaceContainer.
	aPainter startWithSurface: surface.