<<comment
# Help
# Objective of this exercise is to test cloud environment ...
#     plus, start a Web Server
# The hash # is a comment or action ...
#     # is a comment symbol in a .sh file 
# The dollar $ represent a terminal command ... 
#     $ is not part of command

# Start a terminal for commands
$ git clone https://github.com/nighthawkcoders/student.git
$ ./student/activate.sh

# Run the cat command, leave this terminal open ...
#    the cat command shows remaining instructions  ...
#    find this spot and continue on
$ cat ./student/activate.sh

# Start a new terminal ...
#    the "new" terminal is the command terminal ...
#    the "original" terminal shows commands ...
#    type commands in "new" terminal
$ cd student
$ bundle install
$ bundle exec jekyll serve

# End
# The build execution is complete ...
#     Ctl-Click on "link" in terminal ...
#     observe web site in the opened browser

comment

#### Github Pages Local Build
echo "=== GitHub pages build tools  ==="
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
echo "=== Gem install starting, thinking... ==="
gem install jekyll bundler

