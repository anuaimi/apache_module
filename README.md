#Intro#
This project makes it simple and quick to set up an [Apache](http://httpd.apache.org/) module development environment.  It uses [Vagrant](http://vagrantup.com/) to create an [Ubuntu](http://www.ubuntu.com/business/server/overview) VM that has all the required build tools to create and debug Apache modules.  

##Requirements##
 - install Oracle's [VirtualBox](https://www.virtualbox.org/). This is used by Vagrant to create the VM that we'll use.  Here is a link to the [download](https://www.virtualbox.org/wiki/Downloads) page
 - install [Vagrant](http://vagrantup.com/).  You can either [download](http://downloads.vagrantup.com/) the package or install using [RubyGems](https://rubygems.org/gems/vagrant).  If you have any problems, check the [Getting Started](http://vagrantup.com/docs/getting-started/index.html) page.
 - Download the base Ubuntu VM.  
 `$ vagrant box add lucid32 http://files.vagrantup.com/lucid32.box`
 - make sure you have git installed. Github has great [instructions](http://help.github.com/set-up-git-redirect) 
 
##Installation##
 - clone the repo  
     `$ git clone git://github.com/anuaimi/apache_module.git`  
     `cd apache_module`
 - create the virtual machine.  This will start Ubuntu and run [Puppet](http://puppetlabs.com/) to install the needed packages.  It will also download the source to Apache.  
     `$ vagrant up`
 -  The Apache source is put in the shared directory (/vagrant in the VM and the current directory on your host computer) which means you can view/edit the source on your host machine and run it in the VM  
 - When you are ready to compile and run your module, you can ssh into the machine, follow the instruction below  
     `$ vagrant ssh`  
     `$ cd /vagrant`
     `sudo apxs2 -c apache-2.2.xx/modules/experimental/mod_example.c`
 - You can now run Apache and test out your module.
     
##Workflow##
 - configure apache the way that you want it
 - make a copy of the module source you want to change
 - use apxs2 to compile it and link it to the modules directory

##Directories
 - apache runtime is in /usr/lib/apache2.  You'll find the module subdirectory there

##Notes##
 - I had originally tried to install the source into the /vagrant directory so that a developer would be able to use their native OS to editor the source for the module but ran into an issue with VirtualBox not being able to symlink in a shared foler - https://github.com/mitchellh/vagrant/issues/713
