#!/bin/bash

# LSP
nvim --headless +':MasonInstall --force bash-language-server' +q | echo ""
nvim --headless +':MasonInstall --force vim-language-server' +q | echo ""
nvim --headless +':MasonInstall --force lua-language-server' +q | echo ""
nvim --headless +':MasonInstall --force jdtls' +q | echo ""
nvim --headless +':MasonInstall --force typescript-language-server' +q | echo ""

# DAP
nvim --headless +':MasonInstall --force java-debug-adapter' +q | echo ""

# Linter
nvim --headless +':MasonInstall --force sonarlint-language-server' +q | echo ""

# Formatter
nvim --headless +':MasonInstall --force luaformatter' +q | echo ""
nvim --headless +':MasonInstall --force shfmt' +q | echo ""
nvim --headless +':MasonInstall --force google-java-format' +q | echo ""
nvim --headless +':MasonInstall --force prettier' +q | echo ""
