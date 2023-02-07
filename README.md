# sheodox dotfiles

To install first install `make` and `git`, clone this repository to your home folder then run either `make home-desktop` or `make work-desktop`. The only difference between those is the selection of apps installed, the home version includes more apps for gaming and chat.

> Note: These dotfiles are meant for use with the [KDE spin of Fedora](https://spins.fedoraproject.org/en/kde/). The configuration files should generally be distribution agnostic, but the Makefile assumes you're using Fedora.

## Japanese IME

The `mozc` Japanese IME is installed along with Fcitx5 with either of the desktop commands. These dotfiles default the toggle button to Right Shift.

On Ubuntu you can setup `mozc` by doing:
1. `sudo apt install fcitx5-mozc`
1. `sudo apt install fcitx5-config-qt`
1. `im-config -n fcitx5`

Then restart your computer. You might need to run Fcitx5 and then enable mozc and setup settings.


## Shortcuts

Shortcuts aren't managed by these dotfiles yet, but here are some to set:

* Screenshot region to clipboard: `spectacle -bnrc -o /dev/null`

