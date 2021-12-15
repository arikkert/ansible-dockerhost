YAMLLINT=@if which yamllint > /dev/null; then yamllint $@.yml; fi
ANSIBLELINT=@if which ansible-lint > /dev/null; then ansible-lint $@.yml; fi
PLAYBOOK=ansible-playbook $(OPTIONS) $@.yml

main reinstall:
	$(YAMLLINT)
	$(ANSIBLELINT)
	$(PLAYBOOK) #-vvv
