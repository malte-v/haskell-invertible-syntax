# invertible-syntax

## Attribution

This library was not written by me. It is a reference implementation of *Invertable
Syntax Descriptions* by Tillmann Rendel and Klaus Ostermann. For more information,
read their paper: https://www.mathematik.uni-marburg.de/~rendel/rendel10invertible.pdf

## Paper Abstract

Parsers and pretty-printers for a language are often quite similar, yet both are
typically implemented separately, leading to redundancy and potential inconsistency.
We propose a new interface of syntactic descriptions, with which both parser and
pretty-printer can be described as a single program. Whether a syntactic description
is used as a parser or as a pretty-printer is determined by the implementation of
the interface. Syntactic descriptions enable programmers to describe the connection
between concrete and abstract syntax once and for all, and use these descriptions
for parsing or pretty-printing as needed. We also discuss the generalization of
our programming technique towards an algebra of partial isomorphisms.
