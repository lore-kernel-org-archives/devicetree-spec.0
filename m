From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: devicetree docs up on readthedocs
Date: Tue, 12 Dec 2017 11:17:23 +0000
Message-ID: <CACxGe6uoncGWD0U8yeDXzWMCDmFV8fi=sGn6jX52Pdca8oOqyA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=K0QBKGRckZqUs+fZa94lQSBNz6lfZSuFPRH5di5uB1E=;
        b=hiWYen886J+8OTCZOlcBtBV3Q4L7s6HHmM6k1nTfZA+Odki56EAP7hUU5PgssEEzJI
         U620Sd2mlnTbxbtcvbp1MuaYXaJ3r5ebrPH8FMdriSg/VNiSIeMvIFejsJHJsfHc47gF
         mHKJJ7B+lu+mr39oQ15TfNQL2HyahWsYDWQS7llbwOYJkWgRJJevfAOvD7pmEQgJG55F
         EljX7acxIRkZfB6bdnFx3A2rL0BMgHR6cJyQXORjOMJ3SgpC2lKvQvIPPFwbol1UcXqA
         rSpAzQrInHyAfYfS6dr3u5vJDOchLgp8oQvQhTLB3Co68NEVvD/SE0PwS9CVPpJxXd6H
         3FXQ==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

I'm trying out readthedocs for publishing HTML copies of the
devicetree-specification. It's linked to the github project, and the
documents are automatically generated for each commit pushed to the
master branch. It also keeps history on previous releases.

This doesn't replace the official release PDF on github, but it makes
it easier to read online.

It can be found here:

http://devicetree-specification.readthedocs.io/en/latest/introduction.html

Cheers,
g.
