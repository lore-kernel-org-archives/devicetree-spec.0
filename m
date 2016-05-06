From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH DT spec 0/3] Misc fixes and additions for phy-connection-type
Date: Fri, 6 May 2016 11:13:23 +0100
Message-ID: <CACxGe6vd_W1wYGiVV0Kntpf-T+w6R5dFCJkCbe9WR2jH7HL64Q@mail.gmail.com>
References: <1462511327-21077-1-git-send-email-f.fainelli@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=GHpQAkB1k5i+N7xn1flUNs3GUCw/rP1Xit8WfiTrk1g=;
        b=yMIZC+auwrnKQ/qJSC4VtW3YaVfXDYaLbdR15hB7wMfFo00cOeNBOv31l5y2tGVnTK
         ZqtjVkuzehGCX66IECVs8vzC0hnaY3GafL/pWxhAYUqWRzVh92JrNWbySL0uF1HVannG
         97/HCn6WtiPPTRJgKgh7mbZBWZAbB4QVOkRniqaNHG7ND8OPjsvsq754z4hCsI9TWuDF
         2pV8tyicBmfuGPsmxexMQrPJfMfrqEEHUfSmOnTp9SlYxLVcDfiz3mjOA3wuwMbAzKeV
         H5w6B6vOHpUBOTKmLq2cVljiuYvg5WjS2wWr46i/ybjmYTa2iZeHT+2CVFqNdsRCnnQn
         53Iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=GHpQAkB1k5i+N7xn1flUNs3GUCw/rP1Xit8WfiTrk1g=;
        b=A5JRgWRKWHau9nRRsW8eI3PYz8FufcTGGKiK9RS03IRUX8olujyzMOlYjUqAlv1+L9
         S/SnXyo4+/D2hN43DTC6O+VIsuObo3bnC+ikbZVufNgc3JcYEofFUv8AD4d262mrjTRE
         ZpvhDJ9gxvsU+ta1LVX/PD78nsQalPlQQe8RY=
In-Reply-To: <1462511327-21077-1-git-send-email-f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Fri, May 6, 2016 at 6:08 AM, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi Grant,
>
> Here are some fixes in the phy-connection-type property area, thanks!
>
> Florian Fainelli (3):
>   Fix property value for the Gigabit MII type
>   Fix property name, table and defined value for "phy-connection-type"
>   Document additional "phy-connection-type" values
>
>  source/device-bindings.rst | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)

Merged all three. Thanks.

g.

>
> --
> 2.7.4
>
