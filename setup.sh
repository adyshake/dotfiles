# Tested as of Mac OS 12.3.1

# Install zsh

# Install all dependencies
brew install fzf
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

# Windows Style Alt-Tab Switcher
brew install --cask alt-tab

# Fast and user-friendly alternative to find
brew install fd

# Better version of unix's 'cat'
brew install bat

# Also known as 'ag'. Code-search similar to ack
brew install the_silver_searcher

# Download YouTube videos
brew install yt-dlp

# Manage EXIF metadata
brew install exiftool

# Split MP3s using cue files
brew install mp3splt

# Install python dependencies
python -m pip install autopep8

# Sublime plugins
#Terminus

# Add Sublime Text to Path
sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

# Set dock hiding timeout to 15 seconds
defaults write com.apple.Dock autohide-delay -float 15; killall Dock