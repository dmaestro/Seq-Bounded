use v6;
use Test;

use Seq::Bounded;

my $seq = (1 ... 20);
my $seq_bounded = $seq but Bounded;

ok $seq_bounded ~~ Bounded,
    'Role applied to Seq';
nok $seq ~~ Bounded,
    'Original Seq not bounded';

done-testing;
