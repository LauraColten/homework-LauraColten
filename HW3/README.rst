

HW 3: Time for a Time Out!
##########################
:Author: Laura Colten
:Course: COSC2325-004
:Instructor: Roie R. Black
:Started on: February 7, 2019
:Submitted on:  February 8, 2019



Basic measurement units:
========================
(https://www.metric-conversions.org)

    * 1 meter = 39.37 inches

    * 1 mile = 5,280 feet

    * 1 mile = 1,609.34 meters

    * Circumference of the Earth = 24,901 miles
    (https://www.space.com/17638-how-big-is-earth.html)


Basic terminology
=================
(https://www.bipm.org/en/measurement-units/prefixes.html)


We prefix numbers in the world of science with some basic terms. Determine what
these mean:

    * `yotta` something = 10^24 times something

    * `kilo` something = 1,000 times something

    * `hecto` something = 100 times something

    * `deca` something = 10 times something

    * something = something (duh!)

    * `milli` something = 1/1,000 of something

    * `micro` something = 1/1,000,000 of something

    * `nano` something = 1/1,000,000,000 of something

    * `pico` = 1/1000000000000 of something

From Physics
============
(https://www.space.com/15830-light-speed.html)

* What is the speed of light

    * = 186,282 mps (miles per second)

    * = 299,792 kps (kilometers per second)

Speed of Electronic Signals
===========================
(https://www.chemteam.info/Electrons/LightSpeedTrivia.html)

Assuming electronic waves move through wire at the speed of light:

* How far an electronic signal can move through a wire:

    * In one nanosecond = 11.8 inches

    * In one microsecond = 1.01 feet (191,344.81 * 5280) * .000001

    * In one millisecond = 191.34 miles (191,344.81 / 1000)

    * In one second = 191,344.81 miles (299,792,458 * 3.37) / 5280

    * In one second = 7.68 times around the Earth! (191,344.81 / 24,901)

From our World of Processors
============================

One last piece of the puzzle. I would like to see if you can figure out how
fast a signal moves between transistors in a typical Pentium processor. To
figure that out, we need to figure out how far apart they are. We will keep
this simple.

We will look at numbers for the Intel Haswell line of processors.
Unfortunately, most manufacturers use the metric system to report how big (or
small) things are, so all of the numbers in this section will be in meters (or
smaller).

Dig out data for the Haswell Processor. Specifically, use this version:

    * Intel i7-7700, 7th Generation Pentium chip

        * Manufacturing Process = 0.014 nm (http://www.cpu-world.com/CPUs/Core_i7/Intel-Core%20i7%20i7-7700.html)

        * Transistor Count = 2.16 billion transistors (https://www.quora.com/How-many-transistors-are-in-i3-i5-and-i7-processors)

        * Die Size: 126 mm^2 (https://www.quora.com/How-many-transistors-are-in-i3-i5-and-i7-processors)

Lookup this information on the chip:
(https://ark.intel.com/products/97128/Intel-Core-i7-7700-Processor-8M-Cache-up-to-4-20-GHz-)

    * Number of cores = 4

    * Number of threads = 8

    * Maximum (turbo) clock frequency = 4.20 GHz.

    * Maximum memory = 64 GB.

Assuming that the chip is square, and that there are, say, 1,400,000,000 transistors
on the chip, we can take the square root of 1.4 billion to see how many
transistors must be on each side of the square. If the actual chip has a
surface area of 264 square millimeters, figure out how long each side is, and
using your numbers from above, figure out how long it takes for an electronic
signal to move the distance between two adjacent transistors. (Be sure to check
the equation you used to figure this out. Many students mess this one up!)

Square root of 2.16 billion = 46,475.80 (transistors on each side of the square)
Die(Chip) size = 126 mm^2
Square root of 126 = 11.22 mm (Length of each side of the chip)
11.22 / 46,475.80 = 0.00024 (Distance between transistors in mm)

    * Distance between transistors = 240 nanometers. (.00024 * 1000000) (https://www.unitconverters.net/length/millimeter-to-nanometer.htm)

As a check (ballpark, at least), see if your calculations match the
manufacturer's current technology. They report their ability to squeeze
transistors together in nanometers. Are your numbers close?

..  note::

    Remember that there must be room for all the "wires", actually called
    traces, needed to move signals from one place to another. So, it might seem
    like there is plenty of room left for that, in actual fact, we are reaching
    the limits on how small we can manufacture things. That is, unless we come
    up with a new technology!

Finally, calculate the time it will take for an electron to move between two
adjacent transistors.

(https://www.calculateme.com/length/nanometers/to-inches/)
    11.8 inches = 299,720,000 nanometers
    1 nanosecond = 1000 picoseconds
    In 1 nanosecond it moves 299,720,000 nanometers
    In 1 picosecond it moves 299,720,000,000 nanometers

    * Time to move electrons between adjacent transistors = 8 x 10^-10 (0.00000000080) picoseconds.

Counting up
***********

As a last bit of trivia, lets see how big a 64-bit integer really is.

The current Pentium processor uses 64-bit "registers". Assuming your processor is
ticking away at a rate of 2.7 GHz, how long will it take to reach the biggest
number the register can hold (Hint: the biggest number is 2^64 - 1):

2^64 - 1 = 1.84 x 10^19
1.84 x 10^10 / 2.7 billion = 6,832,127,434.71 seconds (bits divided my ghz)
6,832,127,434.71 seconds = 113,868,790.58 minutes (6,832,127,434.71 / 60)
113,868,790.58 minutes = 216.65 years (113,868,790.58 / 525,600)

    * Time until the register hit the maximum value = 216.65 years











