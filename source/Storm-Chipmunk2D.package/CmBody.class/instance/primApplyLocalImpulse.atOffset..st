private
primApplyLocalImpulse: impulseVector atOffset: offsetVector
	^ self indirectCall: #(
		void cpBodyApplyImpulseAtLocalPoint(self,
			cpVect impulseVector,
			cpVect offsetVector) )
	