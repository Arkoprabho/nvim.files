local M = {}
function M.yaml_schema()
	local schema = {
		["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
		-- ["https://raw.githubusercontent.com/vscode-kubernetes-tools/vscode-kubernetes-tools/master/syntaxes/helm.tmLanguage.json"] = "/*.yaml",
		-- kubernetes = "/*.yaml",
	}
	return schema
end

return M
