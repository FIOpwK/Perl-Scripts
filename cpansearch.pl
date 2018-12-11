#!/usr/bin/perl -w

use strict;

use HTTP::Tiny;
use JSON::PP;

my $search = join " ", @ARGV;
my $ua = HTTP::Tiny->new;
my $j =
  $ua->get( "https://fastapi.metacpan.org/v1/search/web?"
      . $ua->www_form_urlencode( { q => $search } ) )->{content};
my $r = JSON::PP->new->utf8->decode($j)->{results};

print " Found: $_\n"
  for map
  join( " - ", grep defined, @{ $_->{hits}[0] }{qw(documentation abstract)} ),
  @$r;
