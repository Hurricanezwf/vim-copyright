# vim-copyright
Vim plugin to automatically add copyright notice to new files.
Supports C/C++, python and bash types.

# Installation
### Install with Vundle
Add following line in your .vimrc:

```Plugin "nemausus/vim-copyright"```

Reload ```.vimrc``` and ```:PlugingInstall``` to install plugin.

### Install with Vim-Plug
Add following line in your .vimrc:

```Plug "nemausus/vim-copyright"```

Reload ```.vimrc``` and ```:PlugInstall``` to install plugin.

# Customization
Define company name to be used in copyright header.

```let g:copyright_company_name = "xyz company"```

By default user name and email is fetched from git config files.
Add following to vimrc to override this behavior.

```let g:copyright_name = "name"```

```let g:copyright_email = "email"```
