# LFPL: Revisited and Mechanized

This repository contains the mechanization and LaTeX source for the paper "LFPL: Revisited and Mechanized" that appeared at the Forty-First Annual Symposium on Logic in Computer Science (LICS 2026).

## Paper

The directory `paper` contains the TeX source files for the submission. To compile them into a PDF (`paper/paper.pdf`), simply run `make paper` from the root directory.

## Mechanization

The directory `mechanization` contains a definition for Martin Hofmann's Linear Function Programming Language (LFPL) within Karl Crary's Istari Proof Assistant and proofs of the two core properties of the language - soundness and completeness with respect to polynomial-time computation. These two together imply that the complexity class of functions definable in LFPL is precisely equal to FP (the class of polynomial-time function problems).

See `mechanization/README.md` for more details about the structure of this directory.

### Checking the Proofs

You will need the [Istari proof assistant](https://istarilogic.org/install.html). Once that is installed and `istari` is in your `PATH`, run `make mechanization` from the root directory. The proofs are quite long, so this process can tens of minutes to complete.

## Slides

The directory `slides` contains the Keynote slides and some supporting assets for the talk "LFPL: Revisited and Mechanized" given at LICS 2026.
