.DEFAULT_GOAL := build

m ?= Updates

.PHONY: generate
generate:
	python generate-all-5-letter-combinations.py > all-5-letter-combinations.txt

.PHONY: dictionary
dictionary:
	bash dictionary-words-get-domains.sh

.PHONY: commit
commit:
	git add --all
	git commit -m "$(m)"

.PHONY: push
push:
	git config user.name "BOECE"
	git config user.email "OfficialBOECE@gmail.com"
	export GIT_SSH_COMMAND='ssh -i ./secrets/boece_id_rsa'
	git push

.PHONY: publish
publish: dictionary commit push
