.PHONY: release
release: git-config
	@git tag $(VERSION) -a -m 'release version $(VERSION)'
	@git push origin $(VERSION)

git-config:
	@git config --global user.email "jianmarf@gmail.com"
	@git config --global user.name "jianmarf"
