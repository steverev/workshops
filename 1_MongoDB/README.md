# Install MongoDB

## Goal
Use Chef to successfully install MongoDB on a RHEL-based target system.

## Steps taken to achieve the end result
Build and test process of Chef code
>Edited recipe locally on Linux VM and ran chef-apply initially (later used chef-client --local-mode).
> Followed instructions from install.rb in workshop git repo, and broke installation into pieces (create repository first, install package, create service - ensure enabled and started)

Tools and resources used in the process
> 
Used Virtualbox and a CentOS 7 VM with Chef-DK installed.  Atom editor / linter-rubocop plugin and occasionally just ssh'd to VM and used vim + cookstyle for edits/changes.
> Used various resources:
> 
> https://docs.chef.io
> 
> https://learn.chef.io
> 
> https://docs.mongodb.com/manual/tutorial/install-mongodb-on-red-hat/
> 
> and "Learning Chef" course on safaribooksonline.com
> 
>
>per instructions created github.com account. 
>
>forked initial github workshop repository

>
>  ran 'git init' in development directory
> 
> git remote add origin http://github.com/steverev/workshops/
> 
> when I felt testing had reasonably accommodated a first pass at success criteria (before attempting bonus topics):
> 
> git commit "initial commit" 
> 
>git push origin master
>


## Success Criteria

You should be prepared and able to demonstrate the following:

Your Chef cookbook successfully executes on your target node without errors
Your Chef cookbook is portable and can be run by Chef to validate your work. Please include any instructions or assumptions needed to successfully execute your cookbook.

> To run on a RHEL machine: 
> ensure ChefDK or at least Chef client are installed
> 
> ensure git is installed
> 
> \# mkdir ~cookbooks ; cd ~cookbooks
> 
> \# git clone https://github.com/steverev/workshops .
> 
>
>\# chef-client --local-mode 1_MongoDB/install.rb
> 

You can login to MongoDB by typing mongo on the target system
You can run chef-client multiple times without failures
Your GitHub.com source code repository shows the history of your work
You should be able to explain the following:

Instructions
Translate the MongoDB installation instructions from install.rb into Chef code that completes the installation
Use the Chef Resources Reference to find the most appropriate Chef resources to use for each task
Once you feel you have met the success criteria outlined above, send a link to your GitHub.com repo to the person coordinating these workshops
Provide instructions for us to run your cookbook so that we can test your work.
There are a couple of ways that you can write, test and run your cookbook.

Write and test your cookbook locally using Test Kitchen via Vagrant + Virtual Box, or the cloud platform of your choice.
Steps for this option are outlined here
Develop directly on your RHEL-based virtual machine
Write your cookbook in vim, nano or emacs, and run chef-client in --local-mode
The ChefDK or Chef Client must be installed on the VM first
Suggested Resources
Use the Chef Documentation to identify and use resources that will help you model the desired state of your infrastructure.
MongoDB Installation Instructions
© 2018 GitHub, Inc.
Terms
Privacy
Security
Status
Help
Contact GitHub
API
Training
Shop
Blog
About
