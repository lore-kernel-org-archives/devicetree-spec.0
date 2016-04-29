From: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Devicetree specification process
Date: Sat, 30 Apr 2016 00:23:41 +0100
Message-ID: <CACxGe6uY-b49YfgBEkJmhjrZ5Pv3+_GPGj+eZOWOkJ43Qc2e4A@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=sRLqQvfp7+pt9yzXS7n9aaYxeGIZWOqgfWiMRQdokbQ=;
        b=e5OosOveZ3oNx5R0JjcfzqKQNaXGZKZsWedBRDcMDZZKbO3UbbzfZqHqdQTXTjb/12
         x/EXOJf75Ngo2QHJZWBqc3FudZTN1mJJLl9MvkEN5CVHkLuVJ2AsE6ehhW3yfrA4/Rdi
         DOE7XF511Ej6nhn9HXtjHFy7XIxvm9tZThdyPzyoEVbxdHuTuscylWVc0QUjb1RSSTAg
         p0dlOwLKc5Fmq5jEeMtCHtuEp1Q/JUXM0eg3g0rJ5KDBrrTtfw4HD4OX0/lxwNC5VrKV
         zjzQBHWgpLYnO+1S+5GPJm2bGrVQ4Gcd/0XL8OmwM27NqVskQVQvgsdsTCNx0ycTqt1p
         KKOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=sRLqQvfp7+pt9yzXS7n9aaYxeGIZWOqgfWiMRQdokbQ=;
        b=Q+o7WG3+2zr5OaP6MsiWGPH9hexCKGkEPEtkxFcRHEwg50a2bAXcfyAhzS20AGjxJm
         hM83mWwj5cVXFRYPv3kOp8Upa5go1Uwc+FK8POir/Vfj+XUSm4fgj2zeGD9kzJ0t9XTd
         f8xFPrVQpw5T+ATWs1LBQfh8Cn/AQnMaa7U58=
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>

I'm pleased to announce the first *very early draft* of the new
devicetree specification that I and several others have been working
on since January. This document picks up where ePAPR left off in 2012.
I'm announcing it now along with the new devicetree.org organization
which will handle governance for the spec.

We're still in the process of getting all the details sorted out (not
everything on the website is accurate at the moment), but in the mean
time you can look at the current state of the document. At the moment,
it is little more than repackaging the ePAPR text. The next step will
be pulling in the new core bindings that were never covered by ePAPR.
You can look at a draft copy of the document here:

https://github.com/kvekaria/devicetree-specification-released/blob/master/prerelease/DevicetreeSpecification-20160429-pre1.pdf

If you want to help out, the document source markup can be cloned from
GitHub. You can find the project page here:

https://github.com/devicetree-org/devicetree-specification

Feedback is greatly appreciate. Please send any comments and/or
changes to the devicetree specification mailing list:

devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

For more information, you can refer to the slides presented at BKK16 and ELC[1].

[1] http://elinux.org/images/b/b7/Devicetree_specification_linaro_connect_bangkok_2016.pdf

Thanks,
g.
