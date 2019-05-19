use v6;
use Test;
use Seq::Bounded;

sub term:<squares> { (1 ... *).map( * ** 2 ) }

ok squares ~~ Seq, 'Test sequence created';

subtest {
    my $chained_seq = (squares but Bounded)
        .while(:skip, * < 144)
        .while(* < 1000);
    my ($min, $max) = $chained_seq[0, *-1];
    is $min, 12 ** 2,
        'Lower bound';
    is $max, 31 ** 2,
        'Upper bound';
    is $chained_seq.elems, 20,
        'Count set of squares';
}, 'Chain beginning and end - while';

subtest {
    my $chained_seq = (squares but Bounded)
        .until(:skip, * > 144)
        .while(* < 675);
    my ($min, $max) = $chained_seq[0, *-1];
    is $min, 13 ** 2,
        'Lower bound';
    is $max, 25 ** 2,
        'Upper bound';
    is $chained_seq.elems, 13,
        'Count set of squares';
}, 'Chain beginning and end - until';

done-testing;
