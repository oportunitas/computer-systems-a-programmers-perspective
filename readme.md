# about

this repo is part of a bigger series of my personal refreshing run of many different computer science concepts i've learned. for me its always fun to revisit these stuff and in turn discover a wider range of knowledge that is buried deep inside certain topics.

in this repo, im exploring the "Computer Systems: A Programmer's Perspective (3rd Edition)" book. for obvious reasons, the actual contents of the book itself is absent from this repository. instead, this repo contains my attempts at the practices in the book and also some other tinkering of my own.

to compile use the below script:

```bash
gcc -Og -fno-pie -no-pie -fcf-protection=none -fno-asynchronous-unwind-tables -save-temps -o <executable> <source>
```

# reading log

## @p.28 (chapter 1 complete)

> sat 4 jul 2026

just completed chapter 1. i've definitely discovered a ton of stuff i've glanced over as unnecessary or things that i downright haven't learned at all in campus. the curriculum at CS ITS is very heavily focused on implementations (which at least for me mostly resulted in _[bodging](https://youtu.be/lIFE7h3m40U?si=UDa1gSqe5lofZNWL&t=19)_ away from stuff from the internet), and where theory is present, its usually in form of rigorous usage of a very narrow selection of concepts.

getting an understanding of computer systems in this book's point of view is a breath of fresh air, even from chapter 1 which is supposedly just an overview of what would be discussed later on.

## @p49 (2.1.3 complete)

> mon 6 jul 2026

the book made me interact with the difference between big-endian vs little-endian in a way that made me understand `why most systems now use little-endian despite its non-intuitive nature at first glance`. in retrospect to everything ive learned in campus, most operations are done on a byte vs byte basis, and having the least significant bytes accessible first, and then the next most significant, and so on and so on, now generally makes sense in order to make calculations faster. (kind of in the same intuition of how we do the same thing when multiplying/adding on paper: start with the last decimal digits first and work upwards instead of the other way around)

im getting a vague sense of how the book overviews how floating numbers work vs integers by this point, its ought to be represented (in binary sense) as: `something`-`integer value`-`something`, which i think is preparing to go to the ieee 754 definition (`sign`-`exponent`-`fraction`) later on.

The convention of defining bytes as a pair of hexadecimal numbers kind of makes more sense overall to me personally by reading the book up to this point. since everything is considered at a byte-level overall in computers, an easier way to represent bytes would ease through reading and understanding machine code or memory contents. decimal numbers are the most intuitive to understand but converting binary to decimal is _dirty_, i guess?...

...in a sense that you cant map every permutation of any number of binary digits to any number of decimal digits *(10 is not a whole number power of 2).* representing an entire byte with a base-256 notation would be the most compact but would be way too unintuitive (at least imo, what symbols would you even need, there's only so many keys in a keyboard, and we would go to represent some numbers with _imo_ weird characters for numbers, like emojis or kanji),...

... so representing 8 bits via a pair of 4 bit-representation through a single hexadecimal digit sounds like the perfect middle ground (some letters are involved, but its generally still intuitive how a-b-c-d-e-f order represents increasing value). and im pretty sure that its probably is the actual reason behind the convention.
