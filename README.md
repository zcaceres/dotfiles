# Setting Up a New Macbook for Development
Tools, configs, and setup.

Last updated for: Mojave (10.14.5)

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

Log in to App Store before continuing.

### List of Tools
Some of these tools are installed from Homebrew. Those that aren't available on Homebrew are installed as global packages via yarn.

`brew` installed:
1. hub: GitHub from the command line
2. nvm: Version manager for NodeJS
3. npm: Package manager for NodeJS
3. yarn: ...also a package manager for NodeJs
4. python3: for Deep Learning, of course!
5. redis: for doing local development with redis
6. hugo: static site generator
7. ffmpeg: working with audio/video on the command line
8. parallel: awesome tool for parallelizing workflows
9. ack: like grep, but better
10. mas: Install apps from the App Store from the command line
11. [wget](https://www.gnu.org/software/wget/): GNU tool for fetching files online

Yarn installed.
1. nodemon: long-running process manager for Node
2. serverless: CLI for working with Serverless
3. carbon-now-cli: awesome screenshots of code from the command line
4. create-react-app: boilerplate generator for React projects
5. [sequelize](https://docs.sequelizejs.com): Node.js ORM for PostgreSQL, MySQL, SQLite and MSSQL
6. serve: start a simple server from the command line
7. browser-sync: synchronized cross-browser testing
8. gcloud: Google Cloud CLI

### List of Programs
All programs installed via `brew cask`.

1. anaconda: Python package manager and environment
2. rescuetime: See how you're wasting time
3. private-internet-access: My preferred VPN
4. cloudapp: easily-shareable screenshots and screen caps
5. postico: minimalist UI to manage your PG instance
6. postgres: postgres desktop
7. tweetdeck: Use Twitter from the desktop
8. postman: test APIs
9. Visual Studio Code: the best text editor
10. obs: streaming app
11. anki: flash card app
12. skype: the classic calling app
13. slack: communication app
14. notion: preferred note-taking / todo app
15. ngrok: easily make localhost public
16. hyper: preferred terminal
17. docker: container management
18. discord: slack for nerds
19. kindle: for reading
20. spotify: for music
21. Brave: browsing without being spied on
22. Google Chrome: for web development
23. Firefox: ...also for web development
24. Trello: Because some teams use it
25. Unity: Game development engine
26. Noun Project: awesome icon library
27. Steam: for when you're feeling unproductive
28. Figma: for working with your design team :-)


### Config Files

### VSCode
My [preferred settings](./setup/settings.json)

My [preferred extensions](./setup/vs-code-extensions.sh)

