# Setting Up a New Macbook or Linux Machine for Development
Tools, configs, and setup.

Last updated for: Ventura (13.4) Macbook M1

### OSX Settings
> Good defaults borrowed from [https://github.com/taniarascia/mac](https://github.com/taniarascia/mac)

- Security and Privacy > General > App Store and identified developers
- Security and Privacy > General > Require password immediately after sleep or screen saver begins
- Security and Privacy > Firewall > On
- Security and Privacy > Privacy > Accessibility > Allow control for Dropbox, Steam, Rescuetime

### List of Tools

`brew` installed:
  - [ack](https://beyondgrep.com/): like grep, but better.
  - [bun](https://bun.sh): drop-in replacement for NodeJS
  - [cloc](https://github.com/AlDanial/cloc): Count, or compute differences of, physical lines of source code in many programming languages.
  - [deno](https://deno.land/): A secure runtime for JavaScript and TypeScript.
  - [fd](https://github.com/sharkdp/fd): Simple, fast and user-friendly alternative to 'find'.
  - [fzf](https://github.com/junegunn/fzf): A general-purpose command-line fuzzy finder.
  - [git-filter-repo](https://github.com/newren/git-filter-repo): Quickly rewrite git repository history (filter-branch replacement).
  - [glow](https://github.com/charmbracelet/glow): Render markdown on the CLI, with pizzazz! 💅🏻
  - [gh](https://cli.github.com/): Github CLI
  - [go](https://golang.org/): Open source programming language that makes it easy to build simple, reliable, and efficient software.
  - [htop](https://htop.dev/): Interactive process viewer.
  - [iftop](https://www.ex-parrot.com/~pdw/iftop/): Display bandwidth usage on an interface.
  - [imagemagick](https://imagemagick.org/index.php): Software suite to create, edit, and compose bitmap images.
  - [jq](https://stedolan.github.io/jq/): Lightweight and flexible command-line JSON processor.
  - [mas](https://github.com/mas-cli/mas): Mac App Store command line interface.
  - [mosh](https://mosh.org/): Mobile shell that supports roaming and intelligent local echo.
  - [nmap](https://nmap.org/): Utility for network discovery and security auditing.
  - [neovim](https://neovim.io/): Vim-fork focused on extensibility and usability.
  - [ocrmypdf](https://ocrmypdf.readthedocs.io/en/latest/): Adds an OCR text layer to PDF documents.
  - [pandoc](https://pandoc.org/): Universal markup converter.
  - [parallel](https://www.gnu.org/software/parallel/): Shell tool for executing jobs in parallel.
  - [pdfgrep](https://pdfgrep.org/): A tool to search text in PDF files.
  - [pipx](https://pipxproject.github.io/pipx/): Execute binaries from Python packages in isolated environments.
  - [shellcheck](https://www.shellcheck.net/): Shell script static analysis tool.
  - [tldr](https://tldr.sh/): Simplified and community-driven man pages.
  - [telnet](https://www.gnu.org/software/inetutils/): User interface to the TELNET protocol.
  - [trash](https://github.com/sindresorhus/trash): Move files and directories to the trash.
  - [tree](https://linux.die.net/man/1/tree): Recursive directory listing command that produces a depth indented listing of files.
  - [watch](https://linux.die.net/man/1/watch): Execute a program periodically, showing output fullscreen.
  - [ytdlp-dl](https://github.com/yt-dlp/yt-dlp): Command-line program to download videos from YouTube.com and other video sites.
  - [zsh](https://www.zsh.org/): Powerful shell with scripting language.

`bun` installed:
  - [carbon-now-cli](https://github.com/mixn/carbon-now-cli): Beautiful images of your code — from right inside your terminal.
  - [netlify-cli](https://www.netlify.com/products/dev/): Netlify command line tool.

`pip3` installed:
  - [csvkit](https://csvkit.readthedocs.io/en/latest/): Suite of utilities for converting to and working with CSV.
  - [jupyterlab](https://jupyter.org/install): Jupyter’s Next-Generation Notebook Interface.
  - [kaggle](https://github.com/Kaggle/kaggle-api): Official Kaggle API.

### List of Programs

`brew cask` installed:
  - [1Password](https://1password.com/): The world’s most-loved password manager.
  - [Anki](https://apps.ankiweb.net/): Powerful, intelligent flash cards.
  - [Arc](https://www.arc.io/): A better browser.
  - [Audacity](https://www.audacityteam.org/): Free, open source, cross-platform audio software.
  - [Brave](https://brave.com/): Secure, Fast & Private Web Browser with Adblocker.
  - [Dash](https://kapeli.com/dash): API Documentation Browser, Snippet Manager.
  - [Discord](https://discordapp.com/store): All-in-one voice and text chat for gamers.
  - [Docker](https://www.docker.com/products/docker-desktop): Empowering App Development for Developers.
  - [Freedom](https://freedom.to/): Block Distractions. Be Productive.
  - [Imageoptim](https://imageoptim.com/mac): Makes images load faster.
  - [iTerm2](https://iterm2.com/): macOS Terminal Replacement.
  - [Kindle](https://www.amazon.com/kindle-dbs/fd/kcp): Amazon's book reader.
  - [Monodraw](https://monodraw.helftone.com/): Powerful ASCII art editor designed for the Mac.
  - [Notion](https://www.notion.so/): All-in-one workspace.
  - [ngrok](https://ngrok.com/): Secure Introspected Tunnels to localhost.
  - [OBS](https://obsproject.com/): Free and open source software for video recording and live streaming.
  - [Postman](https://www.getpostman.com): The Collaboration Platform for API Development.
  - [Pocket](https://getpocket.com/): When you find something you want to view later, put it in Pocket.
  - [Postico](https://eggerapps.at/postico/): A Modern PostgreSQL Client for the Mac.
  - [Private Internet Access](https://www.privateinternetaccess.com/): High-speed anonymous VPN Service.
  - [Rescuetime](https://www.rescuetime.com/): Use your time wisely.
  - Slack: Where work happens.
  - [Signal](https://signal.org/): Say "hello" to a different messaging experience.
  - [Telegram](https://telegram.org/): A new era of messaging.
  - [Visual Studio Code](https://code.visualstudio.com/): Code editing. Redefined.
  - [Warp](https://www.cloudflarewarp.com/): Better Internet for everyone.
  - [WhatsApp](https://www.whatsapp.com/): Simple. Secure. Reliable messaging.

### Config Files
Also copies important config files... VS Code extensions, .gitconfig, .gitignore_global, .vimrc, .zshrc, .zprofile etc.

### Setup Scripts
To set up a new machine, run the appropriate setup script:

- For OSX: `./setup-osx.sh`
- For Linux: `./setup-linux.sh`

These scripts will install Ansible, download the necessary Ansible collections, and then run the appropriate Ansible playbook to set up the machine.
