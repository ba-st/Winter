impulse
applyWorldImpulse: impulsePoint atOffset: offsetPoint
	self
		primApplyWorldImpulse: impulsePoint asCmVector
		atOffset: offsetPoint asCmVector
