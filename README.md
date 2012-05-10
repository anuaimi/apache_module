#Intro#
this project sets up a development environment for apache modules

it uses vagrant to create an ubuntu vm that has all the required build tools to create and debug apache modules.  

##Installation##
 - clone the repo
 
     `git clone git://github.com/anuaimi/apache_module.git`
 - install vagrant
 
     `gem install bundler; bundle install`
    
 - create the virtual machine
 
     `vagrant up`
 - ssh into the machine
 
     `vagrant ssh`
     `cd /vagrant`
 - compile your module

     `apxs2 -c apache-2.2.xx/modules/experimental/mod_example.c
     
##Workflow##
 - configure apache the way that you want it
 - make a copy of the module source you want to change
 - use apxs2 to compile it and link it to the modules directory

##Directories
 - apache runtime is in /usr/lib/apache2.  You'll find the module subdirectory there

##Notes##
 - I had originally tried to install the source into the /vagrant directory so that a developer would be able to use their native OS to editor the source for the module but ran into an issue with VirtualBox not being able to symlink in a shared foler - https://github.com/mitchellh/vagrant/issues/713
