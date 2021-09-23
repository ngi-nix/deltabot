**Nixos Flake :  Chat bot for Deltachat**

[Source](https://github.com/deltachat-bot/deltabot)

Deltabot allows to implement and run chat bots for [Delta Chat](https://delta.chat/en/).
    
## Prerequisites    
Install Nix with flake support as given in [https://nixos.wiki/wiki/Flakes](https://nixos.wiki/wiki/Flakes)    
In debian based systems the method is as follows after installing Nix    
  ```sh    
  nix-env -iA nixpkgs.nixUnstable    
  ```
Edit either ~/.config/nix/nix.conf or /etc/nix/nix.conf and add:    
  ```sh    
  experimental-features = nix-command flakes                           
  ```


### Installation    
To build the flake run
`nix build  github:ngi-nix/deltabot`

deltabot can be run directly by 
`nix run github:ngi-nix/deltabot`

should give the following 

`usage: deltabot [-h] [--stdlog {info,debug,err,warn}] [--version] [--basedir DIR] [--show-ffi] {init,info,list-plugins,serve,add-module,del-module,db_set,db_get,db_del,db_list} ...`

`The deltabot command line offers sub commands for initialization, configuration`
`and web-serving of Delta Chat Bots.  New sub commands may be added via plugins.`

`init                 initialize account with emailadr and password.`
`info                 show information about configured account.`
`list-plugins         list deltabot plugins.`
`serve                serve and react to incoming messages`
`add-module           add python module(s) paths to be loaded as bot plugin(s).`
`del-module           Delete python module(s) plugin path from bot plugins.`
`db_set               Set a low level setting.`
`db_get               Get a low level setting.`
`db_del               Delete a low level setting.`
`db_list              List all key,values.`