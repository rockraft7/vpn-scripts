#!/usr/bin/perl

use LWP::Simple;

my $serviceId = $ARGV[0];
my $url = "http://aws.faizalsidek.com/auth/service/start?serviceId=$serviceId";
my $browser = LWP::UserAgent->new;
my $response = $browser->get($url);

if ($response->content eq "0") {
	exit 0;
} else {
	exit 1;
}
