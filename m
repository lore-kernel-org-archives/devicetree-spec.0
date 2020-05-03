From: CVS <cvs268-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: RFC - DTV (Device Tree Visualiser)
Date: Sun, 3 May 2020 21:57:06 +0530
Message-ID: <CAK-9PRD97nc8JpQ+zov1hAXnzr7u8rBW0NE82Qbg=AeHsUw-2w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=UoKLp3wsAvQ0PDfwYM+iK5Rm0NvZZzksFoZxqClZ7Gs=;
        b=LBqVSlnnvSnRBe1nGEqTAjxc5k4BlYe2Y5gzkMQt6w70dHqNI0vWDXmCZic37L5Kes
         Zy1P84+HbLzIw8jDAJG9w3pqhl2qnBDRH4Jv863lIJwxfhblLcYwywAizT9wuQYQg1X0
         iLG5WSMtp1L5aYLHoy+KwuLky4vgFIouadC6FzkkXxpZv2icCYvVB4i8OVg/Pxswjwft
         OJJfcigxBeEB8A0K7SjFBbuH58CqneOsVOy2MzftjQLDvoy5eQW5boWB8wokV9NmP8Op
         t8canenCl6ek9cytDmkQCmBLRnlkIXtOzSKjKxReIrI8kYKVqajCJbBy2p3NYRc+Z9CJ
         Z6gQ==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hello Everyone,

I often need to review/edit large number of dts(i) files,
in complex include and override hierarchies.
(eg. A single dts file that includes  >70 dtsi files, over 10 levels,
resulting in a device-tree with >5000 lines)

To manage such complexity,
i have written a tool - Device Tree Visualiser (DTV).

Here is annotated screenshot of the "alpha" version of DTV with the
features working so far.
https://drive.google.com/file/d/1VrIueTIQ-m4MRtVTuIWjv2RzzTE_rzGp/view

Note: In the screenshot i have opened a single random DTS file from a
public MSM Android kernel.
https://android.googlesource.com/kernel/msm.git/+/refs/heads/android-msm-coral-4.14-android10/arch/arm64/boot/dts/qcom/sm8150-mtp-overlay.dts

- DTV aims to provide a unified device-tree view,
  with the best of both worlds - decompiled DTB and source DTSI files.

- DTV is written in python3 + Qt5

- DTV uses the source annotation feature available in recent versions of dtc.
  https://www.spinics.net/lists/devicetree-compiler/msg01864.html

- I am currently working on extending DTV to
    - display and hyperlink, the relevant dt-bindings and documentation.
    - support users to easily specify (and run) complex validation logic.
      eg. 2 camera-modules must not share an i2c bus if either is
configured above a certain resolution.

If such a DTV tool seems worthwhile,
i would like to publish/maintain it publicly.
Maybe under https://github.com/devicetree-org/

Currently, i am looking for feedback on this tool / framework.
Let me know any thoughts on this...

regards
CVS
