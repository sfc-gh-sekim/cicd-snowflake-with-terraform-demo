.PHONY: build run


all: default

default:
	echo init plan

init:
	terraform init

plan:
	terraform plan

# NOTE: Run plan before you apply
apply:
	terraform apply

# DANGER
# destroy:
# 	terraform destroy

refresh:
	terraform refresh

refresh-only:
	terraform apply -refresh-only

destroy-target:
	terraform destroy -target=$(target)

import:
	terraform import ${args}
