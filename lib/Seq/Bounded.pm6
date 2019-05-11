use v6;
unit role Seq::Bounded is export;

multi
method while(Seq:D: &cond --> Seq) {
    ( gather for self { last unless .&cond; .take }
    ) but Seq::Bounded
}
multi
method while(Seq:D: &cond, :$skip! --> Seq) {
    ( gather for self { next unless $ ||= ! .&cond ; .take }
    ) but Seq::Bounded
}

multi
method until(Seq:D: &cond --> Seq) {
    ( gather for self { last if .&cond; .take }
    ) but Seq::Bounded
}
multi
method until(Seq:D: &cond, :$skip! --> Seq) {
    ( gather for self { next unless $ ||= .&cond ; .take }
    ) but Seq::Bounded
}
