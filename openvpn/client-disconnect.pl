#!/usr/bin/perl

use LWP::Simple;

my $common_name = $ENV{"common_name"};
my $url = "http://aws.faizalsidek.com/auth/session/invalidate?username=$username&serviceId=1";
my $browser = LWP::UserAgent->new;
my $response = $browser->get($url);


