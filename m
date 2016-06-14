From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [DTSpec PATCH v3] Add items to Devicetree Source Format chapter
Date: Tue, 14 Jun 2016 09:16:36 -0500
Message-ID: <CAL_JsqJ9jdfPvL0Lr6Q=33GjE7jpT3X8phaPmZ1UhxJTzMFgDA@mail.gmail.com>
References: <57585979.1050402@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=23+vca3RN27NQioKDekPtizRzZmq8o9tRlY24ns/Jbk=;
        b=KfhaxVljXS9VLPasW+K4Hmi1lVYPm+i1JDZQfEJD+vCeBwLS3Vfxd15rbOYOga21cF
         kdlux0a9OOJUZCvE9vnJi9dEhbgH5PcWywpOHsRnf3qGZOBihaCpBMp+5z+f41LECRMG
         IimvnSFmDCKP2k2/3sycVbOZ9QVyqhU5dn9K0bYFOhSqeYPQGwgJ3/YHpVF8fyIloMMq
         +qy9GKuKDsvmHt+SRjPduuW1JgQY4+KRgm0/RCwNznpcUNQHHFvwy/NgXURNTt1l0yVx
         33AHjuABuGVoRjyr+YBD3vGgIsoX852OwYYStGG8BeJu2wg2Pf75z/vXtjzfYIWf9ii4
         0IJw==
In-Reply-To: <57585979.1050402-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>

On Wed, Jun 8, 2016 at 12:44 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>
> Add items to Devicetree Source Format chapter
>
> - Add naming convention for DTS files and DTS include files
> - Add /include/ compiler directive
> - Add ";" to end of node definition
> - Add /delete-node/ and /delete-property/
> - Add arithmetic, bitwise, logical, and ternary expressions
>
> Note that cpp directives are not included in this patch, and
> are not yet specified in this appendix.
>
> Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>

Applied.

Rob
