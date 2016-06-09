From: Antony Pavlov <antonynpavlov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: clock documentation
Date: Thu, 9 Jun 2016 16:14:13 +0300
Message-ID: <20160609161413.0acfdccfe3b614ccd095cd20@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=BHMpN7nILXYupRWKWflrtxb5SfHc/9z4VP/x1pzih40=;
        b=pwHs4ti72gctJoZBFeQAak4CyYEhYwzp2iSBJz/txmWN/MTtWEX6HuGOC+Pud2tQCt
         pgNjK/4lXJirB3fUhyP+97TypfoyOHBnO7s8aGTD69QWGdcZXr3pKnsyFOKvDpazQF8t
         7ThG15sPoGgII83E1ajqEtjq1pQaX2ZyHcOwGdM0ttFLzAtqRnIB5PBEtwa+Ek+ld7Mx
         OgziCiSKeVCRiyUdqsHfx0UdMqJfH87QRI2K3huCkHnkHWjF8tiTGEB7RpywuCCFbAZq
         Qqf7wIMwtI6X9Cqglw3PQlnZWloHaUE6Pw0Dr9k/p0fGU9taBYWlemkTTL5v21aaZ2kx
         vqrQ==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi All!

Current linux kernel uses common clock framework and very many devicetr=
ees use clocks.
However Devicetree Specification Release 0.1 (24 May 2016) contains no =
clock mention at all.

Is there any plan on adding devicetree clock documentation into Devicet=
ree Specification?

--=A0
Best regards,
=A0 Antony Pavlov
