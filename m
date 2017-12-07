From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Devicetree Specification prerelease v0.2-pre2
Date: Thu, 7 Dec 2017 23:12:02 +0000
Message-ID: <CACxGe6vOjRxhfgefCjB1-Jx5Lfab+EAkk_ecdrUedA==E6k5LQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=ahV3ZuxFQmjtkv5P41MWJOCW8GiorSaWrAsuHUpLooM=;
        b=w1TzsZQUBfGQI1hS39n4ri19K9tmqfhGZLcoPNRjqyVKsF8ObjFVto/4JdmRtnOLM3
         xoOlIuLssHpnialPZij+/sUHDOLuUunkRzQQ2HNId/7gEHH9AofwA3/J/7T4fHkM1q/r
         VHXeqgnDAu/pYWqyBmxHxs7FcpIvBxwQ0UU0jybBMZA97exqCGkLVBtvXoDMwzZR9prD
         aGJEYWBcuvGmfU6Jfdtw377CcgQnfkVNDw3NhXh3qanVkhgGDXRToencJ6Qs3x7urmth
         BXItxo6Sf7VUaenA8PxXp4d7fwbW52Y6Lrr/1QfDfc1gFmDSDKgry7P7m/dGsTkb0XLV
         2atw==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Hi everyone,

Quick note to say progress is being made on the devicetree
specification again. We've just tagged v0.2-pre2 in preparation for a
v0.2 release before the end of the 2017. You can find the new release
pdf here:

https://github.com/devicetree-org/devicetree-specification/releases

Most of the changes are cosmetic, but there are a few content changes.
You can expect a lot more content changes to go in the v0.3 sometime
early 2018.

7f8e2bd Add more recommended generic node names
ef302c9 Describe interrupts-extended property
4fac2e2 Document additional "phy-connection-type" values
418a599 Add items to Devicetree Source Format chapter

Please take a look and comment. Also, anyone wanting to help improve
the document can find the source here:

https://github.com/devicetree-org/devicetree-specification

g.
