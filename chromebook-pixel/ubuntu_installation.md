# Installing Linux on the Chromebook Pixel.

## Requirements
* USB mouse
* Flash drive with Ubuntu 12.10 installation ("Live CD").

## !!! Caution !!!
This installation method will remove Chrome OS from your device
It's easy to restore the machine with Chroms OS again using [one of the restore images](http://support.google.com/chromeos/bin/answer.py?hl=en&answer=1080595).

## Setup
Put your Pixel into [developer mode](http://www.chromium.org/chromium-os/developer-information-for-chrome-os-devices/chromebook-pixel#TOC-Entering-Developer-Mode1). The process will take about 5 minutes while **formats your user data**. When booting from developer mode, you will see a 30 second warning on boot. You can skip the warning by typing `ctrl-D`.

Boot into Chrome OS and configure it enough so that you can login.  Start a shell by typing `ctrl+alt+t` then `shell`.

```bash
sudo bash
chromeos-firmwareupdate --mode=todev
crossystem dev_boot_usb=1 dev_boot_legacy=1
```

Turn off the machine and plug in the flash drive. Turn the machine on and you'll be greeted with the warning screen. Press `ctrl+l` to get to the SeaBIOS. Press `Esc` when prompted to select your boot device.


Install Ubuntu through the on screen steps, wiping the entire SSD when prompted. Most of the hardware may not work as expected initially. You have the USB mouse right?

Power down and remove the flash drive. Once the Pixel is running again, you'll be presented with the same warning screen. You can wait 30 seconds or type `ctrl+l`. This is annoying but won't get in the way of the process.

You should be running Ubuntu now but we need to [update the kernel](https://docs.google.com/folder/d/0B-HqdeY6UX2FREEtR0t6dnFoSEE/edit?docId=0B-HqdeY6UX2FZGJPSm1tRWsyaU0). Once you've downloaded the archive, extract then install the packages with `sudo dpkg -i linux-*.deb`.

Add the following lines to your `/etc/modules` file.

```
ath9k
atmel_mxt_ts
chromeos_laptop
tpm_tis force=1 interrupts=0
```

You will notice that the resolution is set to the full 2560x1700. You can increase the font size of everything but your experience may not be consistent. It's recommended that you lower the resolution to 1712x1133. The resolution was calculated by `cvt`:

`(2560x1700 / 1.5 = 1706.66667x1133.3333)`
```bash
cvt 1706 1133 60
# 1712x1133 59.93 Hz (CVT) hsync: 70.42 kHz; pclk: 162.25 MHz
Modeline "1712x1133_60.00"  162.25  1712 1832 2008 2304  1133 1136 1146 1175 -hsync +vsync
```

Any resolution with a 3:4 ratio will fit the screen. You can replace your `/etc/X11/xorg.conf` with an [updated version](https://github.com/ericwright90/personal_preferences/blob/master/chromebook-pixel/xorg.conf) that will fix your resolution and make the touchpad easier to use.

The function keys will not work unless you add the [proper keymap](https://github.com/ericwright90/personal_preferences/blob/master/chromebook-pixel/.Xmodmap) to your home directory. The keymap also replaces the search key (super) with escape. I recommend you set a shortcut such as `ctrl+space` in Ubuntu's settings to bring up the dash. `F4` can be set to maximize the current window but you'll need to set that as well. `F5` has been set to screenshot. Right `alt` is set to context menu; make sure to change the Ubuntu shortcut to bring up Dash commands to avoid both commands running at once.

The touchpad's tap behavior is a bit erratic. [Download](https://github.com/ericwright90/personal_preferences/blob/master/chromebook-pixel/.xprofile) and save the `.xprofile` file to your home directory. While the changes will take affect on login, they will not run after logging out and back in. Edit your '/etc/rc.local' file to look like:

```bash
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

/home/YOUR_HOME_DIRECTORY/.xprofile
exit 0
```

Restart your Pixel. The resolution may be unset; if so, open Ubuntu's display settings and select 1712x1133.

The volume scale will be useless since the first 20% or so only seems to make an effect. Open `/etc/pulse/default.pa` and find the comment starting with `### Load audio drivers statically`. Change the portion of configuration file to read as:

```bash
### Load audio drivers statically
### (it's probably better to not load these drivers manually, but instead
### use module-udev-detect -- see below -- for doing this automatically)
#load-module module-alsa-sink
load-module module-alsa-sink control=PCM

#load-module module-alsa-source device=hw:1,0
#load-module module-oss device="/dev/dsp" sink_name=output source_name=input
#load-module module-oss-mmap device="/dev/dsp" sink_name=output source_name=input
#load-module module-null-sink
#load-module module-pipe-sink

### Automatically load driver modules depending on the hardware available
#.ifexists module-udev-detect.so
#load-module module-udev-detect
#load-module module-udev-detect ignore_dB=1

#.else
### Use the static hardware detection module (for systems that lack udev/hal support)
load-module module-detect
#.endif
```
