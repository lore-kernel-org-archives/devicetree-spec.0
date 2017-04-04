From: Waldemar Rymarkiewicz <waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: dtc fails to compile <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>
Date: Tue, 4 Apr 2017 21:00:58 +0200
Message-ID: <CAHKzcENOLqS40rEcV6cnyXymcBdpk9PYq8MzbnOaE19kA5_6oA@mail.gmail.com>
References: <CAHKzcENCdMSxnUC1Ruv5-3hH+y4zpw_8O17_-yutWotLK5GjBw@mail.gmail.com>
 <CAL_JsqKWCKoeFfUPTZ59j3f2mxma+EKu617c3ArOiy-ezTHa+A@mail.gmail.com>
 <CAHKzcEMwb4VMzq-T+b6JwP2UL+VGiTsbj75_Lgz4=v670Huuxg@mail.gmail.com>
 <CAL_JsqKfamJFaWdvDNskp7+m-ihTZ4WxC4GbsVvHuYxv27gALw@mail.gmail.com>
 <CAHKzcEPcEz_vNU7Y6Pm=LkbK+Mk0m6X_z2-K9nTrdaqMVxvUyg@mail.gmail.com>
 <CAL_JsqKx4jxDsQNoZ+UB4FNKNTfo5Gzi89KQa2j9J9OeSyJN2w@mail.gmail.com>
 <CAHKzcENOuF8sUh=P=MX=YWZ6z-dS0fDQKLxoovL1emG1wD2TLA@mail.gmail.com> <22317de6-0ebd-cb73-6ac7-50ac77c97b97@hallowell.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=8aEs2ev98OOEZZfgrXfm9tTKwWVKh5dwvxAt/vWYmzU=;
        b=LJsrHntdywKThHfKuF7vODCKZwIRNXn5GdxOgvPhfRZ5j4/c92TY9bSNUV6VPzeGou
         hYZJIpd8P4DGHHH3tuvtPCyrorbpgr1JvWf7WVWUO7DEuv+b/UHntDem/BlPLLhgtkg6
         9s1UXx0PQKFgnKxcv2DYMtqxj5uB+teidtMB0EpuON3cBj0O6GmGwma1/2SwQlMgoZUw
         wlXEFx94Fk2r5BhcPwFeE1ihk6BAQGgvUEjr25BjlCtVpe5TQYAAgRlXjCOSq4F/bpnF
         L394ZuhNy19bUwdXS60iKIGiuf6WSUc5zce47McvgR+z5gvAE3MIqlxXj4j589FV1ZYf
         y28A==
In-Reply-To: <22317de6-0ebd-cb73-6ac7-50ac77c97b97-he4hYjBaFPgS+FvcfC7Uqw@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Arena <chris-he4hYjBaFPgS+FvcfC7Uqw@public.gmane.org>
Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

> Perhaps you could share what you found so that you won't leave us all
> hanging here wondering how to fix problems such as this?
>
> Chris

Sorry for not being specific here. The issue became obvious if I
looked  on another similar dts that you have explicitly #include
dt-binding  you are interested in :), nothing mips related just
noticed I was missing  #include <bt-binding/thermal/thermal.h>

/Waldek
