accessing
enableSegmentToSegmentCollisions

	self ffiCall: #(void cpEnableSegmentToSegmentCollisions(void))