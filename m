From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Clarify use of mailing list
Date: Fri, 22 Jul 2016 10:11:27 -0500
Message-ID: <CAL_JsqKOv0hbZ5z_xOz3VeDtT18jfm+6wE-uVnoLfZ7u-LxUHQ@mail.gmail.com>
References: <1469109424-2482-1-git-send-email-kanta.vekaria@linaro.org> <B45181E874114CF5A1FAB4752DCAFEAB@erratique.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ww4I01i2cD6DgiE32LvwaUSwUI/mCT32Vc5T+YuiACw=;
        b=l0YQ2ioLxSNzCnFp5RhTu7yOtW9p6Gt0CKQCIKFmztSFKZEoIvYrstXD7M9xba4v2q
         XebBCr1K58mpM//9CdA2UOV/QEXAYyPNP1rdJXckA8eJXLzaPv7h+LE4PqJPJaSdNsMp
         h4SaNvunBPmFVLpnwV/r9b8hdkNV53Umcr9Gw+aHKvLc2B6PG1KYtToYzC+xjpCeZJ6Y
         SnYpVPqZPi+SBjgrvJn8OfQVGlSU78LrbeIY7qeesC16NEJZ1+uuAxKJ8yTArMe0ED6B
         5fWVMFFv7TzmXKQ0NsEzWwaUz/vjppeiY/pLtjlyUwtnUxWFembE9f3PL3iXkaxRHD8e
         ywRw==
In-Reply-To: <B45181E874114CF5A1FAB4752DCAFEAB-llsTEZYSXZwXXHkOk0aIfQ@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?UTF-8?Q?Daniel_B=C3=BCnzli?= <daniel.buenzli-llsTEZYSXZwXXHkOk0aIfQ@public.gmane.org>
Cc: Kanta Vekaria <kanta.vekaria-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, grunk-BIb/Zk+JBDab9/CCa1Sigw@public.gmane.org

On Thu, Jul 21, 2016 at 6:14 PM, Daniel B=C3=BCnzli
<daniel.buenzli-llsTEZYSXZwXXHkOk0aIfQ@public.gmane.org> wrote:
> If you don't want people filling in github issues and submitting pull=
 requests I suggest you explicitely say so after the first github menti=
on.

It's not a case of never. PR are fine, but patches still have to go to
the list for review first. Issues are fine too, but patches will more
likely get some action. The request to publish html docs is a good
example for what can/should be an issue. The other issues should be
patches IMO. Even if you don't know for sure the right fix, write a
patch for what you think is correct or ask on the list.

Rob
