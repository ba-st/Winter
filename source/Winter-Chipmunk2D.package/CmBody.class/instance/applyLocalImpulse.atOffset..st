impulse
applyLocalImpulse: impulsePoint atOffset: offsetPoint
	self
		primApplyLocalImpulse: impulsePoint asCmVector
		atOffset: offsetPoint asCmVector
