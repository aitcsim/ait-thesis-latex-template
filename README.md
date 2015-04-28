# AIT Thesis - LaTeX Template

Installation
------------
**Note:** The installation process takes time to complete since the LaTeX packages are quite large..

### Ubuntu Users
```
git clone https://github.com/aitcsim/ait-thesis-latex-template.git
cd ait-thesis-latex-template
sh setup/bootstrap.sh
```

### Mac OS Users
We do recommend using <a href="https://www.vagrantup.com/" target="_blank">Vagrant</a>.
```
git clone https://github.com/aitcsim/ait-thesis-latex-template.git
cd ait-thesis-latex-template
vagrant up
```

Getting Started
------------
### Ubuntu Users
Easy! You can just run `make` to generate your thesis (PDF file).

### Mac OS Users (using Vagrant)
Do the following steps:
  1. Run `vagrant ssh` to get into the machine.
  2. Run `cd /vagrant/` to go to the <a href="http://docs.vagrantup.com/v2/synced-folders/" target="_blank">synced folder</a>.
  3. Run `make` to generate your thesis (PDF file).
