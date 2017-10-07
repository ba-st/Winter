Accessing
surface 
	^surface ifNil: [ surface := AthensCairoSurface extent: self dimensions ].