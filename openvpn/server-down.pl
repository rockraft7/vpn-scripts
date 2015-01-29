#!/usr/bin/perl

use LWP::Simple;

my $url = "http://aws.faizalsidek.com/auth/service/stop?serviceId=1";
my $browser = LWP::UserAgent->new;
my $response = $browser->get($url);

if ($response->content eq "0") {
        exit 0;
} else {
        exit 1;
}

