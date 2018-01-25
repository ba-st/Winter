tests
testAccessing

	| map |

	map := WinterTiledMap new.

	self
		assert: map layers isEmpty;
		assert: map properties isEmpty;
		assert: map tiles isEmpty