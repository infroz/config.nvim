-- Get the port from environment variable and convert to number
local port = tonumber(os.getenv('GDScript_Port') or '6005')
if not port then
	vim.notify('Invalid GDScript_Port: must be a number', vim.log.levels.ERROR)
	return
end

-- Connect to the language server
local cmd = vim.lsp.rpc.connect('127.0.0.1', port)

-- Pipe used for Godot to open files in nvim
local pipe = '/tmp/godot.pipe'

vim.lsp.start({
	name = 'Godot',
	cmd = cmd,
	root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
	on_attach = function(client, bufnr)
		if vim.v.servername == '' then
			vim.fn.serverstart(pipe)
		end
	end
})
