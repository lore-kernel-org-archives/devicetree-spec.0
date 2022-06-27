From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH] Add 'dma-noncoherent' property as a standard property
Date: Mon, 27 Jun 2022 17:51:51 +0200
Message-ID: <3674511.kQq0lBPeGt@diego>
References: <20220619203719.3604757-1-heiko@sntech.de> <CAL_JsqK20v34ZFWzeicaVoDWmjAsBwPyc89kaV-26Se_1eKtmQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqK20v34ZFWzeicaVoDWmjAsBwPyc89kaV-26Se_1eKtmQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mailing List <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>

Am Montag, 27. Juni 2022, 17:14:45 CEST schrieb Rob Herring:
> On Sun, Jun 19, 2022 at 2:37 PM Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org> wrote:
> >
> > Similar to the 'dma-coherent' property, some architectures may be coherent
> > by default with some devices being non-coherent. Add a property for this
> > case tool.
> 
> Looks fine, but I also need a schema.
> 
> Yeah, that's redundant unfortunately. Maybe someday someone will care
> enough to generate the spec from the schemas.

No worries and sorry I didn't think of where the schema comes from
in the first place. I'll do the relevant schema work as well.

Heiko


> > Signed-off-by: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
> > ---
> > Companion patch to RISC-V Zicbom noncoherent dma support
> > https://lore.kernel.org/linux-riscv/20220619203212.3604485-1-heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org/
> >
> >  source/chapter2-devicetree-basics.rst | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devicetree-basics.rst
> > index 47d2fad..bdd7b9f 100644
> > --- a/source/chapter2-devicetree-basics.rst
> > +++ b/source/chapter2-devicetree-basics.rst
> > @@ -832,6 +832,19 @@ Description:
> >     coherent DMA operations. Some architectures have coherent DMA by default
> >     and this property is not applicable.
> >
> > +dma-noncoherent
> > +~~~~~~~~~~~~
> > +
> > +Property name: ``dma-noncoherent``
> > +
> > +Value type: ``<empty>``
> > +
> > +Description:
> > +   For architectures which are by default coherent for I/O, the
> > +   *dma-noncoherent* property is used to indicate a device is not capable of
> > +   coherent DMA operations. Some architectures have non-coherent DMA by
> > +   default and this property is not applicable.
> > +
> >  name (deprecated)
> >  ~~~~~~~~~~~~~~~~~
> >
> > --
> > 2.35.1
> >
> 




