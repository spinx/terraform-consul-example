.PHONY: plan apply modules setup

AZ_PATH = `find . -type f -name 'getvariables.rb' -exec dirname {} \; | tail -n 1`

default: setup

setup: 
	terraform get
	ruby "${AZ_PATH}/getvariables.rb"
	mv variables.tf.json "${AZ_PATH}/variables.tf.json"
