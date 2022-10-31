# Tested as of Mac OS 12.3.1

# Install zsh

# Install all dependencies
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

brew install fd
brew install bat
brew install the_silver_searcher
brew install yt-dlp
brew install exiftool
brew install mp3splt

# Install python dependencies
python -m pip install autopep8

# Sublime plugins
#Terminus

# Add Sublime Text to Path
sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl