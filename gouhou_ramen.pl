#!/usr/bin/env perl

use strict;
use warnings;
use Net::Twitter;
use Data::Dumper;
use utf8;
use Config::Pit;

# ~/.pit/配下にyamlがある
my $config = Config::Pit::get("OAuth");

my $nt = Net::Twitter->new(
	traits => [qw/API::RESTv1_1/],
	consumer_key => $config->{consumer_key},
	consumer_secret => $config->{consumer_secret},
	access_token => $config->{access_token},
	access_token_secret => $config->{access_token_secret},
);

=pod
my $result = $nt->home_timeline({
	count => 5,
});

if (ref($result) eq 'ARRAY') {
	foreach my $twit (@$result) {
		print $twit->{user}->{screen_name} . ":" . $twit->{text} . "\n";
	}
}
=cut
#my $result = $nt->update("twitter api test");
# my $result = $nt->update("日本語 実験");
# print Dumper $result;
#my $result = $nt->update("![*](*)!");
#print Dumper $result;
#print Dumper $result;
#my $result = $nt->update_profile_image([ "./ramen.png" ]);
#print Dumper $result;

if ($ARGV[0] == 1) {
	# 木曜日の処理
	$nt->update_profile({
		name => 'itochin@今日はラーメンの日',
	});
	$nt->update_profile_image([ "/Users/itochin/work/dev/perl/gouhou_ramen/ramen.png" ]);
	$nt->update("本日は合法ラーメンの日です！！");
	#print Dumper $result;
} else {
	# 金曜日の処理
	$nt->update_profile({
		name => 'itochin',
	});
	$nt->update_profile_image([ "/Users/itochin/work/dev/perl/gouhou_ramen/normal.png" ]);
	my $result = $nt->update("合法ラーメンの日は終了しました。また来週までさようなら。");
# print "update_profile";
#print Dumper $result;
#	$result = $nt->update_profile_image([ "/Users/itochin/work/dev/perl/gouhou_ramen/test.jpeg" ]);
#print "update";
#print Dumper $result;
}

=pod
50 1 19 6 * perl /Users/itochin/work/dev/perl/gouhou_ramen/gouhou_ramen.pl 1
5 0 * * 4 perl /Users/itochin/work/dev/perl/gouhou_ramen/gouhou_ramen.pl 1
5 0 * * 5 perl /Users/itochin/work/dev/perl/gouhou_ramen/gouhou_ramen.pl 0
=cut
