# Caliper Display

This repository hosts PCB and microcontroller files created in around 2010 for a digital caliper display with offset calculation.

## Background

Back then, I had worked on some high-end lathes (non-CNC) which had glass calipers and the corresponding interface to set offsets via the integrated numblock in school.
When we got ourselves a small lathe and milling machine for some non-commercial metal working (turned out to be mostly aluminium) I didn't want to miss out on those features.
There were some displays available, but they were far too pricey for what they offer (for me back then, and tbh still today).
So I ended up designing what you see in this repository.

Michael Kirsch, 2020

## Features

* Support up to 5 different calipers
* Switch between lathe (X and Z) and milling (X and Y) mode
* 5th input can be programmed to be lathe's Zo or milling's Z axis
* Lathe X axis is measured in diameter (doubling the measured values)
* Each axis can be set to a user-defined value
* 3-line 7-segment LED displays
* One Euro-sized double-layered PCB
* A simple case I don't remember where from

## Structure in this repo

TBD

## License

I've decided to publish this project under the GNU GPLv3. See [LICENSE](./LICENSE) for the legal details.
