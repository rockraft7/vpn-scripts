#!/usr/bin/perl
use Tie::File;
use LWP::Simple;
use Config::IniFiles;

sub getLine {
	my $wanted;
	my ($file,$line) = @_;
	
	while(<$file>) {
		if ($. == $line) {
			$wanted = $_;
			last;
		}
	}
	return $wanted;
}

sub readConfig {
	my ($section, $name) = @_;
	$cfg = Config::IniFiles->new(-file => "/etc/config.ini");
	my $value = $cfg->val($section, $name);
	return $value;
}

my $serviceId = readConfig('manager', 'ServiceId');
my $serviceUrl = readConfig('manager', 'ServiceUrl');
my $serviceUsername = readConfig('manager', 'ServiceUsername');
my $servicePassword = readConfig('manager', 'ServicePassword');
my $serviceRealm = readConfig('manager', 'ServiceRealm');

my $common_name = $ENV{"common_name"};

my $url = "$serviceUrl/auth/session/create?username=$common_name&serviceId=$serviceId";
my $ua = LWP::UserAgent->new;
$ua->credentials($serviceUrl, $serviceRealm, $serviceUsername, $servicePassword);
my $response = $ua->get($url);

if ($response->content eq "0") {
	print "ok\n";
	exit 0;
} else {
	print "failed\n";
	exit 1;
}
