finalization
tearDown

	[ game scheduler terminateProcess.
	game screen scheduler terminateProcess ]
		on: Error
		do: [  ]