From: George Hopkins <george-hopkins-ifvz4xmYPRU@public.gmane.org>
Subject: MIME type of Devicetree Blobs and Sources
Date: Sun, 1 Mar 2020 12:56:39 +0100
Message-ID: <20200301115638.GF8357@localhost>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mail.com;
        s=dbd5af2cbaf7; t=1583064103;
        bh=VPSBaJrS1oxG0v9L3N+x8XCyteGYHih2g330Z81B/Sg=;
        h=X-UI-Sender-Class:Date:From:To:Subject;
        b=0YnD+JGeDmQ2dTYGgbzrFmxklO0OlbhQ+WU9oQpWFB3j/UeBAGhoftoz6pMDDUn6/
         /DugDwDFIpxxKAnl6tm6rRrdkVYrkSw9MMScjWXwVcvyE1edFs3UX3OR0Wj4x/zCza
         zIvsAReTRcA0Lp7ZCPAtthbo5mwhSQ8NbIhd2zv4=
Content-Disposition: inline
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello,

while developing a syntax highlighting scheme for Devicetree sources, I
tried to find out if there is an official MIME type for Devicetree blobs
and sources. So far, I have not found anything which looks like an
official recommendation. However, I would not be surprised if I just
missed it.

In case there is no official recommendation, I would propose
`application/devicetree` (FDT) and `text/devicetree` (DTS). These can be
registered at IANA [1]. If no registration is desired, the subtypes can
be prefixed with "x-".

-- George

[1]: https://www.iana.org/assignments/media-types/media-types.xhtml
