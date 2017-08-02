From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: [TECH TOPIC] Devicetree Tooling and Validation
Date: Wed, 2 Aug 2017 15:08:20 +0100
Message-ID: <CACxGe6sjbZZG=Tai4gYKMrmOnsjXjwp8AEVsuasGMh6WTVHRcg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=QFtucPlsjRvVD7XW695sPxj+yBihyhOJLjZbDKvxG4M=;
        b=KJABDFtGLsLOAKAxq7CyLKs6isqkXbGVZ2MGHrYikxrh+pi7h9glqYsVKNZlcqf+Ll
         r8V0DbkBcAPEQ69dVOJnvNH30rvKWzv+JWZaqlUo45+5zhvUWkNIT8TpeVuMez6jI2+k
         YqbafvblTcWgxDfKEu6Qh/q7TcqLd5SCScKDBlRnGGFW9r0E/TQbavt6ziBGSaPcFWyj
         GemblWd3fdMwg1tXgqME0EBONdDyZN1VWcf9G9FD/SibvUv06anMCItL3HYZUROs0ncC
         YW7cCRMl5fUImWcCHPggMOatzAHBFOfVi6ahkBalzwUAmmALy4VNhTcEwd0VhBZNW7Bn
         8GKA==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi folks,

Late entry: I'd like to propose holding a 1/2 day Devicetree
miniconference at Kernel Summit this year. There is a need to talk
about current proposals on the table for devicetree validation and
tooling options, as well as hammering out better sharing between
projects.

I had originally been planning to do this at Linux Plumbers Conference
13-15 September in LA, but a large number of the key participants will
be in Prague for ELCE, but not in LA for Plumbers.

The Plumbers devicetree wiki page is being used to wrangle specific topics:

http://wiki.linuxplumbersconf.org/2017:device_tree

Cheers,
g.
