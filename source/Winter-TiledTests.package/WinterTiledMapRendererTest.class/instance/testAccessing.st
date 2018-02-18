tests
testAccessing

	|renderer |

	renderer := WinterTiledMapRenderer of: map .

	self
		assert: renderer map equals: map;
		assert: renderer unitScale equals: 1.0.

	renderer unitScale: 2.0.

	self assert: renderer unitScale equals: 2.0