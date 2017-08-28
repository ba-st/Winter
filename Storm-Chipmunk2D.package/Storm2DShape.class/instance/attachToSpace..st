private
attachToSpace: space
	"Body can be nil if we use body static body or rogues"
	self physicBody
		ifNotNil: [ :body | space addBody: body ].
	space addShape: self physicShape.	
