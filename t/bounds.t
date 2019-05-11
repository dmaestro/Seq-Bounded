use v6;
use Test;
use Seq::Bounded;

sub term:<squares> { (1 ... *).map( * ** 2 ) }

ok squares ~~ Seq, 'Test sequence created';

subtest {
    my $until_gt_12 = (squares but Bounded).until: * > 144;
    is $until_gt_12.elems, 12,
        'Up to square of 12';
    my $while_lt_12 = (squares but Bounded).while: * < 144;
    is $while_lt_12.elems, 11,
        'While lt square of 12';
}, 'Bound sequence at end';

subtest {
    my $begin_12 = (squares but Bounded).while(:skip, * < 144);
    is $begin_12[0], 144,
        'Start sequence at 12 squared';
    my $start_after_12 = (squares but Bounded).until(:skip, * > 144);
    is $start_after_12[0], 169,
        'Start sequence after 12 squared';
}, 'Bound sequence at beginning';

done-testing;
