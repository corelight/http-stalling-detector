HTTP Stalling Detector
======================

HTTP stalling DoS attacks take advantage of an inability for webservers
to determine if a remote client is just connected over a slow link or
if the remote client is deliberately sending data very slowly to avoid
the webserver doing a timeout and shutting down the connection to preserve
local system resources. The behavior that is typically seen by attackers
is to open a lot of connections a slowly dribble out data to prevent the 
webserver from timing out the connection. If a webserver is using a 
smallish worker pool, this resource exhaustion can be easy to reach.

Many modern webservers have become more defensive about these type of 
resource exhaustion attacks, but it's still prudent to watch for the attacks
and it's very plausible that a number of vulnerable web servers are still
present in production networks.  It's also possible that a webserver might 
be resistent to one form of the attack and still vulnerable to another. For 
example, a webserver might be resistent to data being sent slowly in POST body
but vulnerable to data being sent slowly in a single HTTP header or multiple 
HTTP headers. This script is intended to catch the overall notion of data 
being sent too slowly in any part of the client request and should catch any
of these attack styles.

Installation
------------

This is easiest to install through the Bro package manager::

	bro-pkg refresh
	bro-pkg install bro/corelight/http-stalling-detector

Usage
-----

The output from this script is a pair of notices:

**HTTPStalling::Attacker** - This indicates that attacker performing an
HTTP stalling attack was detected.

**HTTPStalling::Victim** - This indicates that a particular host was 
targetted by one or more attackers.

The notices are split into two like this because there is some software
to do these attacks that can use proxies to spread out the attackers
across many originating IP addresses.  The concern is that if a single
request is all that ever comes from an IP address, the attack would never
be detected.  By splitting into attackers and victims, the victim shows
up very clearly even in the presence of this type of attempt at obfuscation.


About
-----

Written by Seth Hall <seth@corelight.com>

