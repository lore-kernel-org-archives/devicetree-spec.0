From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/2] Syntax highlighting
Date: Tue, 15 Nov 2016 17:04:40 -0600
Message-ID: <CAL_JsqJRju2_o+dnQvgrXobrkPEPpW027E4wS67YqK84DPi4cQ@mail.gmail.com>
References: <1477635173-9292-1-git-send-email-stewart@linux.vnet.ibm.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=mBIfq1MJ1P9uPd+7BuZCYHl+SSt1VYrp2Dq+pTrEt5k=;
        b=ao2iBhO0O5/p+1ahmoERZ2EhYVZ3sCTQHqpp5wdT6LogSUiu+cCvSyMqjDebTbV6+z
         0nTPvFXyy8ptNjGSkJ4USZpVgiz6yX2CjYH0C8kbtkGfCBenaMbJuWCpLZJgaxMaA/5S
         rFuBuUs24ePmfLGcriFkafnTfb+8UTHRMsc6xlsSKVnf0reJUwO4ABH7TiRzNmbDn7rR
         hZ1y8pnnU7R71Cjrez3uPaH3WTPoiHrh0KAEuUPrNnkyMA+zjwlD7r/kSf9NTSkeN6NK
         K5oSjawMNw61XCemrMEXU5SKWQmqhtZZUclTGK6x8zQ3ZyfPSoMwIsjmIihubcPvgP/f
         3/Gg==
In-Reply-To: <1477635173-9292-1-git-send-email-stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stewart Smith <stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Fri, Oct 28, 2016 at 1:12 AM, Stewart Smith
<stewart-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org> wrote:
> Since http://pygments.org/ (what Sphinx uses for syntax highlighting)
> doesn't do DTS yet, implement DTS syntax highlighting and then use it
> (and the standard C source highlighting).
>
> I'll be submitting the DTS highlighting upstream too, but having it in
> tree will ensure it works for people not running a future version of
> pygments.
>
> Stewart Smith (2):
>   Enable syntax highlighting of device tree source
>   Syntax highlight C and DTS

Sorry for the delay. Looks nice and I've applied both. Thanks.

Rob
