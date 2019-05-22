use v6;
unit role Seq::Bounded:ver<1.0> is export;
=begin pod

=head1 NAME

Seq::Bounded

=head1 SYNOPSIS

=begin code
use Seq::Bounded;

my $infinite-squares = { 1, 2 ... * }.map(* ** 2);

my $three-digit-squares = ($infinite-squares but Bounded)
    .while(:skip, * < 100)
    .until(* >= 1000);
=end code

=head1 DESCRIPTION

This role, when applied to a (possibly infinite) sequence, allows adding
bounds conditions based the values of the sequence. This is useful when
an infinite Seq is mapped by a function - in such a case, it could be
inconvenient to specify the bound in the sequence generator.

Applying this role adds the methods C<while> and C<until>. An optional
adverb C<:skip> converts the bound from the end of the Seq to the start.

The role only applies to classes (and objects) of type C<Seq> or its
subclasses.

=head1 METHODS

=end pod

#| while tests the given condition against each member of the sequence
#| and terminates the sequence when the condition is no longer satisfied.
multi
method while(Seq:D: &cond --> Seq) {
    ( gather for self { last unless .&cond; .take }
    ) but Seq::Bounded
}
#| with the :skip adverb
multi
method while(Seq:D: &cond, :$skip! --> Seq) {
    ( gather for self { next unless $ ||= ! .&cond ; .take }
    ) but Seq::Bounded
}

#| until tests the given condition against each member of the sequence
#| and terminates the sequence when the condition is satisfied.
multi
method until(Seq:D: &cond --> Seq) {
    ( gather for self { last if .&cond; .take }
    ) but Seq::Bounded
}
#| with the :skip adverb
multi
method until(Seq:D: &cond, :$skip! --> Seq) {
    ( gather for self { next unless $ ||= .&cond ; .take }
    ) but Seq::Bounded
}

=LICENSE This file is licensed under the same terms as perl itself.

=AUTHOR Doug Schrag <dmaestro@cpan.org>
