From: Kumar Gala <galak.kernel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: UART map / multiple uart connections
Date: Thu, 7 Jul 2022 12:56:24 -0500
Message-ID: <A6CFEC90-1DB9-419C-A9C6-4F490B06F015@kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.100.31\))
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:content-transfer-encoding:mime-version:subject:message-id:date
         :cc:to;
        bh=EzvqZ4jZIqf8mL51dlQRwvYG9ckjg1kqwY5dHIO3Ja4=;
        b=CsQlIGNybkGQ/aDIFNrH3AHAzEC8DcVeTDp0DWZzGi2AOlHvlakKar7PlyRiMObean
         rD7dcjib4ci0j/tMPUZ32+G4Hv1u/wrqNXe5kIkrWHoY1krHO9TCp46E0MuNKojiRF6i
         sTgXUdM3sYMNDAjpOMdX9aG0bp5FSgd99gjK/ni6Hlppne8bJCAjgbQAF8yXQHE4fYCk
         zfTnK04MEzXuxcH5oTHyhy64XjLUz4leYSudYm1F9/VMclnrhxyYexasCKaTrt7Si0A5
         auIL4+DbOOx0zL1P28z++2or4jYud3oQm94cr4nFpVFSV5d5db5Jut1Y2/FoO7Xeeroq
         oo0A==
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Wondering if your aware of any examples of how to describe a modem with =
multiple UART connections.  Normally we have the =E2=80=9Cmodem=E2=80=9D =
as a child of the UART node.  So that would work for one connection, but =
not sure how we=E2=80=99d describe a second UART connection.  Some kinda =
of =E2=80=9Cuart-map=E2=80=9D?

- k=
