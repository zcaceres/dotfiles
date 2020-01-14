# Setting Up a New Macbook for Development
Tools, configs, and setup.

Last updated for: Catalina (10.15.2)

### OSX Settings
> Good defaults borrowed from [https://github.com/taniarascia/mac](https://github.com/taniarascia/mac)

Security and Privacy > General > App Store and identified developers
Security and Privacy > General > Require password immediately after sleep or screen saver begins
Security and Privacy > Firewall > On
Security and Privacy > Privacy > Accessibility > Allow control for Dropbox, Steam, Rescuetime

```sh
chflags nohidden ~/Library
defaults write com.apple.finder AppleShowAllFiles YES
defaults write com.apple.finder ShowPathbar -bool true
```

Log in to the Mac App Store before continuing.

### List of Tools
Some of these tools are installed from Homebrew. Those that aren't available on Homebrew are installed as global packages via yarn.

Included in this is the setup for `go` `python3` and `NodeJS`.

`brew` installed:
  - [hub](https://hub.github.com/): GitHub from the command line
  - python3
  - [nvm](https://github.com/nvm-sh/nvm): Version manager for NodeJS
  - youtube-dl: download youtube videos from the command line
  - go: the language
  - mosh: nicer SSH
  - cowsay: the legend
  - jq: use JSON in bash
  - dep: package management for Go
  - [npm](https://www.npmjs.com/): Package manager for NodeJS
  - [yarn](https://yarnpkg.com/en/): ...also a package manager for NodeJs
  - [python3](https://www.python.org/): for Deep Learning, of course!
  - [redis](https://redis.io/topics/rediscli): for doing local development with Redis
  - [hugo](https://gohugo.io/): static site generator
  - [ffmpeg](https://ffmpeg.org): working with audio/video on the command line
  - [parallel](https://www.gnu.org/software/parallel/): awesome tool for parallelizing workflows
  - [ack](https://beyondgrep.com/): like grep, but better
  - [mas](https://github.com/mas-cli/mas): Install apps from the App Store from the command line
  - [wget](https://www.gnu.org/software/wget/): GNU tool for fetching files online
  - [awscli](https://github.com/aws/aws-cli): Amazon Web Services CLI

`yarn` installed:
  - [nodemon](https://nodemon.io/): long-running process manager for Node
  - [serverless](https://serverless.com/framework/docs/providers/aws/cli-reference/): CLI for working with Serverless
  - [carbon-now-cli](https://github.com/mixn/carbon-now-cli): awesome screenshots of code from the command line
  - [create-react-app](https://github.com/facebook/create-react-app): boilerplate generator for React projects
  - [sequelize](https://docs.sequelizejs.com): Node.js ORM for PostgreSQL, MySQL, SQLite and MSSQL
  - [serve](https://www.npmjs.com/package/serve): start a simple server from the command line
  - [browser-sync](https://browsersync.io/): synchronized cross-browser testing
  - [gcloud](https://cloud.google.com/sdk/gcloud/): Google Cloud CLI

### List of Programs

`brew cask` installed:
  - [anaconda](https://www.anaconda.com/distribution/): Python package manager and environment
  - [rescuetime](https://www.rescuetime.com/): See how you're wasting time
  - [Private Internet Access](https://www.privateinternetaccess.com/): My preferred VPN
  - [CloudApp](https://www.getcloudapp.com/): easily-shareable screenshots and screen caps
  - [Postico](https://eggerapps.at/postico/): minimalist UI to manage your PG instance
  - [Postgres](https://www.postgresql.org/): postgres desktop
  - [Postman](https://www.getpostman.com): test APIs
  - [Visual Studio Code](https://code.visualstudio.com/): the best text editor
  - [OBS](https://obsproject.com/): streaming app
  - [Anki](https://apps.ankiweb.net/): flash card app
  - [Skype](https://www.skype.com/en/): the classic calling app
  - [Notion](https://www.notion.so/): preferred note-taking / todo app
  - [ngrok](https://ngrok.com/): turn localhost into a public webserver
  - [hyper](https://hyper.is/): terminal built with web tech (mostly for fun)
  - iterm2: preferred terminal
  - [Docker](https://www.docker.com/products/docker-desktop): container management
  - [Discord](https://discordapp.com/store): for off-Slack communities
  - Spotify: for music
  - Google Chrome: for web development
  - Firefox: ...also for web development
  - Slack: communication app
  - [Unity](https://unity.com/): Game development engine
  - [Brave](https://brave.com/): browsing without being spied on
  - [Steam](https://store.steampowered.com/): for when you're feeling unproductive
  - [Figma](https://www.figma.com/): for working with your design team
  - Adobe Creative Cloud: to design with XD

`mas` installed:
  - [TweetDeck](https://tweetdeck.twitter.com/): Use Twitter from the desktop
  - Kindle: for reading

### Config Files
Config files are all written to HOME automatically in `setup.sh`.

### VSCode
My [preferred settings](./vscode/settings.json)

My [preferred extensions](./vscode/vs-code-extensions.sh)

