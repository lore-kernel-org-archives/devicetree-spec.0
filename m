From: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH DT spec 0/3] Misc fixes and additions for phy-connection-type
Date: Thu,  5 May 2016 22:08:44 -0700
Message-ID: <1462511327-21077-1-git-send-email-f.fainelli@gmail.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=7WUhulyofernqzAUuxdXpDFyXaL9c2/H7kKikQb38xU=;
        b=RpQydXpvou6l78BKl1wAGnJrKXduvENu7IljdCB3CvP7J2e9nl/M6WM1BnT8+5ULG1
         ZpZjAHkgOccvR9UXSU4nF53dQveB+g1AafF+ca7HAApILwhOxF8bBjWZNAR747ttb/YS
         coqRPkNrt4bnqb6Z9cj0gFFLAN4AvP8RaLdE6FtbMOCZSclSo3ly+wpmdM++9/j0H1AH
         VI0zToxnyYnAfx/c0XBI+kFzuWutHa3h+eZLc06R9lENvHKef/w5Uw03X8eHgMqkFsIi
         INF4OeHXbOqCwu8IKzupVCv3jTh/04BFkYFzPXs7NpxOoYbIiVVDf47//ciyTOvzVZvs
         So8w==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Hi Grant,

Here are some fixes in the phy-connection-type property area, thanks!

Florian Fainelli (3):
  Fix property value for the Gigabit MII type
  Fix property name, table and defined value for "phy-connection-type"
  Document additional "phy-connection-type" values

 source/device-bindings.rst | 37 +++++++++++++++++++++----------------
 1 file changed, 21 insertions(+), 16 deletions(-)

-- 
2.7.4
