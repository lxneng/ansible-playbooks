diff-vscode-ext:
	bash -c "diff <(yq '.[].roles.[].users.[].visual_studio_code_extensions.[]' setup-vscode.yml | sort) <(code --list-extensions)"
setup-vscode:
	ansible-playbook -i hosts setup-vscode.yml