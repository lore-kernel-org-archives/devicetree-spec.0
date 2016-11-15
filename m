From: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Follow up from Plumbers and next steps?
Date: Tue, 15 Nov 2016 10:46:22 -0600
Message-ID: <3665B3F0-8C9F-423C-8E7B-0EF7ACAB1DE9@linaro.org>
References: <CAKM2CV+iOGLBtu0MbF+bS=baJ9zz5MOLSMP1ChDOHcmwHs9cTQ@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=d9nMEMrgtlcbw1TgHag/jR1eyiuiCZlZHDspXEOFIlE=;
        b=H0h1WNs3jwQmz+QFtXbBWyWhKpXOBp+Lo3l+pAB3NZKlucpnqVWpR/81agd2CMSY7d
         17ZS3nOMnViEq5hwmQnY7j3ePDyqbTBArsK2VshU06qZOWoLmpHBS0yqb/Yvfc3Nv3ah
         LwrqvlvXx7tj2USZpg+HwIg6Gb7fR88g792Mw=
In-Reply-To: <CAKM2CV+iOGLBtu0MbF+bS=baJ9zz5MOLSMP1ChDOHcmwHs9cTQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "darknighte-p1iUmGEPI8RGBRGhe+f61g@public.gmane.org" <darknighte-p1iUmGEPI8RGBRGhe+f61g@public.gmane.org>
Cc: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org


> On Nov 15, 2016, at 10:12 AM, darknighte <darknighte-p1iUmGEPI8RGBRGhe+f61g@public.gmane.org> wrote:
> 
> Folks,
> 
>  Sorry that I couldn't make it to LPC this year.  How'd it go and
> where are we with the spec?
>  I've got some cycles in the next few weeks, so, I thought I'd check in.

Grant started doing some hacking on schema and parsing tools here:

https://github.com/glikely/dtgendoc

Based on the work Matt Porter started.

- k
