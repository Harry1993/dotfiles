use strict;
use warnings;
use vars qw($VERSION %IRSSI);
use Irssi;

$VERSION = '0.0.6';
%IRSSI = (
	name => 'fnotify',
	authors => 'Tyler Abair, Thorsten Leemhuis, James Shubin' .
               ', Serge van Ginderachter',
	contact => 'fedora@leemhuis.info, serge@vanginderachter.be',
	description => 'Write notifications to a file in a consistent format.',
	license => 'GNU General Public License',
	url => 'http://www.leemhuis.info/files/fnotify/fnotify https://ttboj.wordpress.com/',
);

#
#	README
#
# To use:
# $ cp fnotify.pl ~/.irssi/scripts/fnotify.pl
# irssi> /load perl
# irssi> /script load fnotify
# irssi> /set fnotify_ignore_hilight 0 # ignore hilights of priority 0
#

#
#	AUTHORS
#
# Ignore hilighted messages with priority = fnotify_ignore_hilight
# version: 0.0.6
# Tyler Abair <tyler.abair@gmail.com>
#
# Strip non-parsed left over codes (Bitlbee otr messages)
# version: 0.0.5
# Serge van Ginderachter <serge@vanginderachter.be>
#
# Consistent output formatting by James Shubin:
# version: 0.0.4
# https://ttboj.wordpress.com/
# note: changed license back to original GPL from Thorsten Leemhuis (svg)
#
# Modified from the Thorsten Leemhuis <fedora@leemhuis.info>
# version: 0.0.3
# http://www.leemhuis.info/files/fnotify/fnotify
#
# In parts based on knotify.pl 0.1.1 by Hugo Haas:
# http://larve.net/people/hugo/2005/01/knotify.pl
#
# Which is based on osd.pl 0.3.3 by Jeroen Coekaerts, Koenraad Heijlen:
# http://www.irssi.org/scripts/scripts/osd.pl
#
# Other parts based on notify.pl from Luke Macken:
# http://fedora.feedjack.org/user/918/
#

my %config;

Irssi::settings_add_int('fnotify', 'fnotify_ignore_hilight' => -1);
$config{'ignore_hilight'} = Irssi::settings_get_int('fnotify_ignore_hilight');

Irssi::signal_add(
    'setup changed' => sub {
        $config{'ignore_hilight'} = Irssi::settings_get_int('fnotify_ignore_hilight');
    }
);

#
#	catch private messages
#
sub priv_msg {
	my ($server, $msg, $nick, $address, $target) = @_;
	my $msg_stripped = Irssi::strip_codes($msg);
	my $network = $server->{tag};
	ifttt_notify();
}

#
#	catch 'hilight's
#
sub hilight {
	my ($dest, $text, $stripped) = @_;
    my $ihl = $config{'ignore_hilight'};
	if ($dest->{level} & MSGLEVEL_HILIGHT && $dest->{hilight_priority} != $ihl) {
		my $server = $dest->{server};
		my $network = $server->{tag};
		ifttt_notify();
	}
}

#
#	beep to ifttt
#
sub ifttt_notify {
	system("bash /home/yman/.irssi/scripts/ifttt_notify.sh")

	# in ifttt_notify.sh, there is one line of command:
	# pyfttt -k [your_ifttt_token] -e [your_event_name] [notification_message]
}

#
#	irssi signals
#
Irssi::signal_add_last("message private", "priv_msg");
Irssi::signal_add_last("print text", "hilight");
