.PHONY: release
release:
	@git tag $(VERSION) -a -m 'release version $(VERSION)'
	@git push origin $(VERSION)

