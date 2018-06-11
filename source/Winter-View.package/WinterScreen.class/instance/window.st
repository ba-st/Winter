Accessing
window

	^ window ifNil: [ self createWindow  ] ifNotNil: [window] 