local dap = require 'dap'

dap.adapters.php = {
    type = 'executable',
    command = 'node',
    args = { '/Users/heyfara/Documents/Programmation/Neovim/vscode-php-debug/out/phpDebug.js' }
}

dap.configurations.php = {
    {
        type = 'php',
        request = 'launch',
        name = 'Listen for Xdebug',
        port = 9003,
        pathMappings = {
            ["/application"] = "${workspaceFolder}"
        }
    }
}
