accessing
bootstrapArena: arenaDescriptor
	arena cells: (Array new: arenaDescriptor cellDescriptors size).
	arenaDescriptor cellDescriptors withIndexDo: [ :column :colIndex | 
		| newCol |
		newCol := Array new: column size.
		arena cells at: colIndex put: newCol.
		column withIndexDo: [ :indexDescr :cellIndex | 
			| newCell |
			newCell := WBACell new.
			newCol at: cellIndex put: newCell.
			arenaDescriptor dispatchIndex: indexDescr on: self with: newCell ] ].
	self bootstrapCellNeighbours.