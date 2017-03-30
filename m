From: Waldemar Rymarkiewicz <waldemar.rymarkiewicz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: dtc fails to compile <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>
Date: Thu, 30 Mar 2017 11:20:58 +0200
Message-ID: <CAHKzcENCdMSxnUC1Ruv5-3hH+y4zpw_8O17_-yutWotLK5GjBw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=mWY4mXGHt45sH+XZU8L26X2ogg3f8+/K59crkcCWP18=;
        b=j9MNEj/bSCYocscgJRqGNN+628qhgvhkKVfDLTJJmDBau1h6k27rNfikYLcgF7q93d
         Z7VpYduBcfbcHenlkFSBd4QZXB/OZzLNYq79HjbhTy4jnkpwuMDnWdxw8oBmBQSuNORH
         8FAMij9bMdxLN7KgMw0+uG6UsheGu94Bwu9ntDY5KeGcWbq4E2ahYoI53HR+v3t+hTA6
         alixQnhAXRVgh3fMZLdimLGcvW6pTSA6cEJuvk0uyTpCcx8rY+NQ0d86VtTsqWUe+WI0
         PoEEHizHdtClJKvqPz0Z7/C/6l2ppnWuq0UXdOhJum/jWMY6d5NknmoNOdDWhMQdKD1Q
         03bQ==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,

I build DT for thermal zone according to

http://lxr.free-electrons.com/source/Documentation/devicetree/bindings/thermal/thermal.txt#L261

but dtc (DTC 1.4.1-g53bf130b) fails with syntax error.

    Error: ../dts/xrx500.dtsi:1060.14-15 syntax error
    FATAL ERROR: Unable to parse input tree

The problem is with cooling-device property

      cooling-maps {
295                         map0 {
296                                 trip = <&cpu_alert0>;
297                                 cooling-device =
298                                     <&cpu0 THERMAL_NO_LIMIT
THERMAL_NO_LIMIT>;
299                         };
300                 };

if I use phandle like <&cpu0> it compiles but  <&cpu0 THERMAL_NO_LIMIT
THERMAL_NO_LIMIT>; fails.

What could be a reason? any hint ?

Thanks
/Waldek
