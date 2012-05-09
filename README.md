#Intro#
this project sets up a development environment for apache modules

it uses vagrant to create an ubuntu vm that has all the required build tools to create and debug apache modules.  

##Steps to Use##
 - clone the repo
 
     `git clone git://github.com/anuaimi/apache_module.git`
 - install vagrant
 
     `gem install bundler; bundle install`
    
 - create the virtual machine
 
     `vagrant up`
 - ssh into the machine
 
     `vagrant ssh`
     
