From: Steve McIntyre <steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: System DT - thinking a sprint would help
Date: Thu, 6 Feb 2020 15:59:07 +0000
Message-ID: <20200206155907.GQ6796@tack.einval.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=osoOsZ8FKK5zJM6gjdEibf1yKf6NjOVffyI/6NGN7wA=;
        b=PIBIIgbjo9b6ScNLXzPtNPL9x2pXI8/skrgaIdBhQSD22y7pCKoJlxydGxsAvokecg
         xPsT1aEOhB4nA/cvV+O/wMPIb+pGlBAv2tXFz3bsguN6TOsiaEGukFIiNIMg8aLIdDol
         AYmXesL8UJq7Ar8cpCiq6o5TXANNoE6hP+VEIE65Sk2AFgsU7PGVzMf4nbzLrxH8s3I8
         ourow7kQ9KOMIFkgxvHCPY1VG+HP+o/8I+5PEtpMSTbuCz0elB85HBgQssE7JsHdTYD5
         keYWyxEoEAj1oBsbFx9QrTdhToGt2JhEEpJNgZPYri+mqZymSFlcBBBeGiXmDNaf7+Y9
         0bbg==
Content-Disposition: inline
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dte-all-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, system-dt-ZwoEplunGu1b+pB8xrm1Mtaxn9tAw+E3@public.gmane.org
Cc: Grant Likely <Grant.Likely-5wv7dgnIgG8@public.gmane.org>, Arnd Bergmann <arnd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <Rob.Herring-5wv7dgnIgG8@public.gmane.org>, Mark Brown <mark.brown-5wv7dgnIgG8@public.gmane.org>, Stefano Stabellini <stefanos-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Bruce Ashfield <bruce.ashfield-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Benjamin Gaignard <benjamin.gaignard-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Hi all!

[ tl;dr - we're trying to organise a sprint - see the end ]

Due to the Linux on Arm meetup this week, quite a few of our DT
community happened to be in Cambridge together last night. We took the
opportunity to get together for food and beer, and we naturally ended
up mulling over a whole range of things, not least the ongoing System
DT design work.

As is the nature of this kind of gathering, we had a whole range of
opinions and ideas, much more than I can faithfully recall to share
here in great detail. Grant has been keen to try and keep system-dt
compatible with Linux DT usage if that's possible, and Stefano has
been working with that in mind. Rob is concerned about how things
might scale with lots of domains, for example. Olof is keen to talk
about a higher-level design to make it easier to express complex
layouts. And so on.

There is one thing that *did* stand out: we agreed that it's probably
time to try and get all of the interested people in a room together
for a few days with a whiteboard, to really thrash out what's needed
and how to achieve it. With the right people, we can go through all
our needs, pick up the ideas we have and hopefully get some prototypes
ready to evaluate.

So, who's interested? I believe all the people in CC here are likely
keen to be involved. Anybody else?

Although we have Linaro Connect in Budapest at the end of March,
that's really *not* a good place to try and meet up, for a couple of
reasons: not everybody will be there, and we'll have too many
distractions to be able to focus on this. Let's *not* do that.

AFAICS we're geographically roughly split between US/Canada and
Europe, so I'm thinking a week in either the US or Europe, some time
in the next 2-3 months:

 * Would a week before or after Connect work, in Europe (16th-20th
   March, or 30th March to 3rd April)? I can look for options in the
   UK easily, with maybe either Arm or Linaro hosting.

 * Alternatively, a week's meeting in the US, deliberately avoiding
   the Connect week so we don't wipe people out with travel: Maybe 2-6
   or 9-13 March? Or push back into April if that's too short notice,
   of course. Would Xilinx be able to host something for us, maybe? Or
   another possibility might be the Linaro office in Nashua?

I'm open to other suggestions for time and venue. Let's try to make
something work here?

Cheers,

Steve

-- 
Steve McIntyre                                steve.mcintyre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
<http://www.linaro.org/> Linaro.org | Open source software for ARM SoCs

