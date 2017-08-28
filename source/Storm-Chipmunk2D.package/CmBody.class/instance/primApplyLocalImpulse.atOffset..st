private
primApplyLocalImpulse: impulseVector atOffset: offsetVector
	^ self ffiCall:  #(
		void cpBodyApplyImpulseAtLocalPoint(self,
			cpVect impulseVector,
			cpVect offsetVector) )
	