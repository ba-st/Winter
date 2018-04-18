Stepping
step

	| event |

	event := WinterSceneUpdatedEvent scene: self.

	self handleEvent: event.
	self players do: [ :eachPlayer | eachPlayer handleEvent: event ].
	self components do: [ :eachShape | eachShape handleEvent: event ]