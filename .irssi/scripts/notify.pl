# See http://www.leemhuis.info/files/fnotify/fnotify
# for the script that this one is originated from.

use strict;
use warnings;
use vars qw($VERSION %IRSSI);
use Irssi;

$VERSION = '0.0.7';
%IRSSI = (
	name => 'notify',
	authors => 'Tyler Abair, Thorsten Leemhuis, James Shubin' .
               ', Serge van Ginderachter, Yanmao Man',
	contact => 'fedora@leemhuis.info, serge@vanginderachter.be',
	description => 'Send IFTTT notifications',
	license => 'GNU General Public License',
	url => 'https://github.com/Harry1993/dotfiles/blob/master/.irssi/scripts/notify.pl',
);

#
#	README
#
# To use:
# $ put this script under ~/.irssi/scripts/
# irssi> /load perl
# irssi> /script load notify.pl
# irssi> /set notify_ignore_hilight 0 # ignore hilights of priority 0
#

my %config;

Irssi::settings_add_int('notify', 'notify_ignore_hilight' => -1);
$config{'ignore_hilight'} = Irssi::settings_get_int('notify_ignore_hilight');

Irssi::signal_add(
    'setup changed' => sub {
        $config{'ignore_hilight'} = Irssi::settings_get_int('notify_ignore_hilight');
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
