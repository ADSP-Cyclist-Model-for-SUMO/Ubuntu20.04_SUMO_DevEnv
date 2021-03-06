# Ubuntu 20.04 desktop VM for SUMO development

Based on a Ubuntu 20.04 installation, this Vagrant file installs the dependencies for [SUMO (Simulation of Urban MObility)](https://sumo.dlr.de/docs/index.html)
and builds SUMO from source.

## Credit
This project is based on https://github.com/arnemertz/Xubuntu1604_DevBox and https://github.com/heidemn/vagrant-bionic-desktop/blob/master/install-desktop.sh, but has been extensively modified.

## Installation

### VirtualBox
Download and install Oracle VirtualBox from https://www.virtualbox.org/

#### Windows-only
Make sure to turn off all Windows features related to virtualization

### Vagrant
Download and install Vagrant from https://www.vagrantup.com/

### Dowload the SUMO source code
Clone the repository containing the SUMO code you want to build (e.g. from https://github.com/ADSP-Cyclist-Model-for-SUMO/sumo) into a directory named `sumo` on the same level as this directory.  

That means the source code is expected to be located at `../sumo` in relation to this directory.

### Create and provision the VM
Clone the git repository or download and unpack the zip archive. 
Open a shell in this directory and run

```vagrant up```

This will take a while when you run it for the first time.
Vagrant will download the base box, launch the virtual machine, install all the dependencies and build the source code.

### Login
When the software installation is complete (`vagrant up` command finished), run 

```vagrant reload```

This will restart the VM and it should come up again with a graphical login screen. Login using the following credentials:

Username: `vagrant`  
Password: `vagrant`

You should now see a basic Ubuntu desktop.

## Start SUMO
To start SUMO, you have to switch to the SUMO directory via `cd /sumo`.  
Now you can run `./bin/sumo`, `./bin/sumo-gui`, `./bin/netedit`, etc. to run the respective application.

## Development
To develop for SUMO you can now install the IDE or Editor of your choice directly inside the VM and work from there. Alternatively you can use an IDE with remote SSH capabilities such as VSCode or CLion running on your host system and connect it to the VM.

### CLion remote config
A guide for configuring CLion can be found here: https://github.com/mdklatt/clion-remote/tree/2021.2

* The SSH port is probably set to `2222`
* You can find out the location of the SSH private key by running `vagrant ssh-config`
* In the Deployment settings, choose type `Local or mounted folder` and reflect your folder mounting in the `Mappings` tab. `Local path` is the local path on your host machine, `Deployment path` should be `/sumo`

### Performance issues
If permance issues (while building) occur, this is most probably caused by the synced folder...
* https://stackoverflow.com/questions/34729859/slow-vagrant-box-how-to-improve-this
* https://blog.theodo.com/2017/07/speed-vagrant-synced-folders/
* https://github.com/rdsubhas/vagrant-faster


## Additional tools
The development environment configured here, may or should be extended by the following tools:

* IDE / Code editor (e.g. CLion, VSCode, Sublime Text, ...)
* Different compiler (Clang)
* Package manger (Conan)
* a better terminal setup
* ...
 










