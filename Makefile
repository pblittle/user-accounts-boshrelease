build:
	bosh create release --force
	bosh upload release
