NAME
====

Seq::Bounded

SYNOPSIS
========

    use Seq::Bounded;

    my $infinite-squares = { 1, 2 ... * }.map(* ** 2);

    my $three-digit-squares = ($infinite-squares but Bounded)
        .while(:skip, * < 100)
        .until(* >= 1000);

DESCRIPTION
===========

This role, when applied to a (possibly infinite) sequence, allows adding bounds conditions based the values of the sequence. This is useful when an infinite Seq is mapped by a function - in such a case, it could be inconvenient to specify the bound in the sequence generator.

Applying this role adds the methods `while` and `until`. An optional adverb `:skip` converts the bound from the end of the Seq to the start.

The role only applies to classes (and objects) of type `Seq` or its subclasses.

METHODS
=======

### method while

```perl6
method while(
    &cond
) returns Seq
```

while tests the given condition against each member of the sequence and terminates the sequence when the condition is no longer satisfied.

### method while

```perl6
method while(
    &cond,
    :$skip!
) returns Seq
```

with the :skip adverb

### method until

```perl6
method until(
    &cond
) returns Seq
```

until tests the given condition against each member of the sequence and terminates the sequence when the condition is satisfied.

### method until

```perl6
method until(
    &cond,
    :$skip!
) returns Seq
```

with the :skip adverb

LICENSE
=======

This file is licensed under the same terms as perl itself.

AUTHOR
======

Doug Schrag <dmaestro@cpan.org>

