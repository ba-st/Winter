accessing
bootstrapCellNeighbours
	| fakeCell |
	"down left right up"
	fakeCell := WBACell new.
	fakeCell element: WBAWall new.
	arena cells withIndexDo: [ :col :colIndex |
		col withIndexDo: [ :cell :cellIndex |
			cell neighbours: (Array new: 4).
			cell neighbours at: 2 put: (colIndex > 1 
				ifTrue: [(arena cells at: colIndex - 1) at: cellIndex]
				ifFalse: [ fakeCell ]). 
			cell neighbours at: 3 put: (colIndex < arena cells size
				ifTrue: [(arena cells at: colIndex + 1) at: cellIndex]
				ifFalse: [ fakeCell ]). 
			cell neighbours at: 4 put: (cellIndex > 1
				ifTrue: [ col at: cellIndex - 1 ]
				ifFalse: [ fakeCell ]).
			cell neighbours at: 1 put: (cellIndex < col size
				ifTrue: [ col at: cellIndex + 1 ]
				ifFalse: [ fakeCell ]).
	] ]