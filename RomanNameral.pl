use strict;
use warnings;


    while (1) {
        print "Enter a name to see its weight: \n\n";
        $_ = <STDIN>;    # input
        chomp $_;
        exit 0 if ( $_ eq "" );
        my %valuest =    # set up, input control w/ %hash value
          ( I => 1, X => 10, V => 5, M => 1000, D => 500, C => 100, L => 50, );

        sub score {
            my $str   = shift;
            my $score = 0;
            foreach my $key ( keys %valuest ) {
                my $count = () = $str =~ /(\Q$key\E)/gi;
                $score += $count * $valuest{$key};
            }
            return $score;
        }
        print "\n\n";
        print " weight is: ";
        print score "$_";    # output
        print "\n\n";
    }
