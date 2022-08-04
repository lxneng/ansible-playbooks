diff-vscode-ext:
	bash -c "diff <(yq '.[].roles.[].users.[].visual_studio_code_extensions.[]' setup-vscode.yml | sort) <(code --list-extensions)"
setup-vscode:
	ansible-playbook -i hosts setup-vscode.yml
install-vscode-extensions:
	yq '.[].roles.[].users.[].visual_studio_code_extensions.[]' setup-vscode.yml | sort | xargs -L 1 code --install-extension
write-vscode-settings-on-mac:
	yq '.[].roles.[].users.[].visual_studio_code_settings' -o json setup-vscode.yml > ~/Library/Application\ Support/Code/User/settings.json
