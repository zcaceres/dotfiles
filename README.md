# Setting Up a New Macbook for Development
Tools, configs, and setup.

Last updated for: Ventura (13.2) Macbook M2

### OSX Settings
> Good defaults borrowed from [https://github.com/taniarascia/mac](https://github.com/taniarascia/mac)

Security and Privacy > General > App Store and identified developers
Security and Privacy > General > Require password immediately after sleep or screen saver begins
Security and Privacy > Firewall > On
Security and Privacy > Privacy > Accessibility > Allow control for Dropbox, Steam, Rescuetime

(Some defaults are also in `setup.sh`).

Log in to the Mac App Store before continuing.

### List of Tools
Some of these tools are installed from Homebrew. Those that aren't available on Homebrew are installed as global packages via yarn.

Included in this is the setup for `go`, `python3`, and `nodejs`, my preferred languages.

`brew` installed:
  - [ack](https://beyondgrep.com/): like grep, but better
  - [awscli](https://github.com/aws/aws-cli): Amazon Web Services CLI
  - cowsay: the legend
  - dep: package management for Go
  - [ffmpeg](https://ffmpeg.org): working with audio/video on the command line
  - go: the language
  - [hub](https://hub.github.com/): GitHub from the command line
  - [hugo](https://gohugo.io/): static site generator
  - jq: use JSON in bash
  - [mas](https://github.com/mas-cli/mas): Install apps from the App Store from the command line
  - mosh: nicer SSH
  - [nvm](https://github.com/nvm-sh/nvm): Version manager for NodeJS
  - [npm](https://www.npmjs.com/): Package manager for NodeJS
  - [parallel](https://www.gnu.org/software/parallel/): awesome tool for parallelizing workflows
  - [python3](https://www.python.org/): for Deep Learning, of course!
  - [redis](https://redis.io/topics/rediscli): for doing local development with Redis
  - [wget](https://www.gnu.org/software/wget/): GNU tool for fetching files online
  - [yarn](https://yarnpkg.com/en/): ...also a package manager for NodeJs
  - youtube-dl: download youtube videos from the command line

`yarn` installed:
  - [browser-sync](https://browsersync.io/): synchronized cross-browser testing
  - [carbon-now-cli](https://github.com/mixn/carbon-now-cli): awesome screenshots of code from the command line
  - [create-react-app](https://github.com/facebook/create-react-app): boilerplate generator for React projects
  - [gcloud](https://cloud.google.com/sdk/gcloud/): Google Cloud CLI
  - [nodemon](https://nodemon.io/): long-running process manager for Node
  - [serverless](https://serverless.com/framework/docs/providers/aws/cli-reference/): CLI for working with Serverless
  - [sequelize](https://docs.sequelizejs.com): Node.js ORM for PostgreSQL, MySQL, SQLite and MSSQL
  - [serve](https://www.npmjs.com/package/serve): start a simple server from the command line

### List of Programs

`brew cask` installed:
  - Adobe Creative Cloud: to design with XD
  - [Anaconda](https://www.anaconda.com/distribution/): Python package manager and environment
  - [Anki](https://apps.ankiweb.net/): flash card app
  - Chrome: for web development
  - [Brave](https://brave.com/): browse without being spied on
  - [Discord](https://discordapp.com/store): for off-Slack communities
  - [Docker](https://www.docker.com/products/docker-desktop): container management
  - [Figma](https://www.figma.com/): for working with your design team
  - iTerm2: preferred terminal
  - Firefox: ...also for web development
  - [ngrok](https://ngrok.com/): turn localhost into a public webserver
  - [Notion](https://www.notion.so/): preferred note-taking / todo app
  - [OBS](https://obsproject.com/): streaming app
  - [Private Internet Access](https://www.privateinternetaccess.com/): My preferred VPN
  - [Postico](https://eggerapps.at/postico/): minimalist UI to manage your PG instance
  - [Postgres](https://www.postgresql.org/): postgres desktop
  - [Postman](https://www.getpostman.com): test APIs
  - [Rescuetime](https://www.rescuetime.com/): See how you're wasting time
  - [Skype](https://www.skype.com/en/): the classic calling app
  - Slack: communication app
  - Spotify: for music
  - [Steam](https://store.steampowered.com/): for when you're feeling unproductive
  - [Unity](https://unity.com/): Game development engine
  - [Visual Studio Code](https://code.visualstudio.com/): the best text editor
  - Kindle: for reading

### Config Files
Config files are copied automatically in `setup.sh`. Check there for details.

### VSCode
My [preferred settings](./vscode/settings.json)

My [preferred extensions](./vscode/vs-code-extensions.sh)
