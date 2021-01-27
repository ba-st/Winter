Class {
	#name : #AthensCairoSDLSurface,
	#superclass : #AthensCairoSurface,
	#category : #'Winter-Pharo9-Support'
}

{ #category : #'instance creation' }
AthensCairoSDLSurface class >> fromSDLSurface: surface [

	^ (self
		   primImageFromData: surface pixels
		   width: surface w
		   height: surface h
		   pitch: surface pitch) initialize
]
