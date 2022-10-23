#!/usr/bin/env bash

## Install brew

SCRIPT_PATH=$(
  cd "$(dirname "${BASH_SOURCE}")"
  pwd -P
)

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
source ${SCRIPT_PATH}/.path

## Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`
brew install gnu-sed
# Install a modern version of Bash & Zsh.
brew install bash
brew install bash-completion@2
brew install zsh

# Switch to using brew-installed zsh as default shell
if ! grep -F -q "${BREW_PREFIX}/bin/zsh" /etc/shells; then
  echo "${BREW_PREFIX}/bin/zsh" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/zsh";
fi;

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

# Install more recent versions of some macOS tools.
brew install vim
brew install grep
brew install openssh
brew install ssh-copy-id
brew install tmux
brew install gmp
brew install git
brew install git-lfs
brew install wget

######################################################################
# Install some CTF tools; see https://github.com/ctfs/write-ups.
######################################################################

## Next-generation aircrack with lots of new features
brew install aircrack-ng

## Remove large files or passwords from Git history like git-filter-branch
brew install bfg

## GNU binary tools for native development
brew install binutils

## Searches a binary image for embedded files and executable code
brew install binwalk

## Work on automating classical cipher cracking in C
brew install cifer

## Tools to work with Android .dex and Java .class files
brew install dex2jar

## TCP over DNS tunnel
brew install dns2tcp

## Zip password cracker
brew install fcrackzip

## Console program to recover files based on their headers and footers
brew install foremost

## Tool to exploit hash length extension attack
brew install hashpump

## Network logon cracker which supports many services
brew install hydra

## Featureful UNIX password cracker
brew install john

## Port-knock server
brew install knock

## Image manipulation
brew install netpbm

## Port scanning utility for large networks
brew install nmap

## Print info and check PNG, JNG, and MNG files
brew install pngcheck

## SOcket CAT: netcat on steroids
brew install socat

## Penetration testing for SQL injection and database servers
brew install sqlmap

## TCP/IP packet demultiplexer
brew install tcpflow

## Replay saved tcpdump files at arbitrary speeds
brew install tcpreplay

## Analyze tcpdump output
brew install tcptrace

## Tools for building TCP client-server applications
brew install ucspi-tcp

## PDF viewer
brew install xpdf

## General-purpose data compression with high compression ratio
brew install xz

###############################################
# Install other useful binaries.
###############################################

## Search tool like grep, but optimized for programmers
brew install ack

## Interpreter for PostScript and PDF
brew install gs

## Tools and libraries to manipulate images in many formats
brew install imagemagick --with-webp

## Powerful, lightweight programming language
brew install lua

## Text-based web browser
brew install lynx

# 7-Zip (high compression file archiver) implementation
brew install p7zip

## Parallel gzip
brew install pigz

## Monitor data's progress through a pipe
brew install pv

## Perl-powered file rename script with many helpful built-ins
brew install rename

## Readline wrapper: adds readline support to tools that lack it
brew install rlwrap

## Display directories as trees (with optional color/HTML output)
brew install tree

## Visual Binary Diff
brew install vbindiff

## New zlib (gzip, deflate) compatible compressor
brew install zopfli

## Remove outdated versions from the cellar.
brew cleanup
