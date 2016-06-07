From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [DTSpec PATCH] Add items to Devicetree Source Format chapter
Date: Tue, 7 Jun 2016 09:31:39 -0500
Message-ID: <CAL_JsqKi9fOz3CEK-os8WE4BEuYi28METxWN0GMpW95wAXYFMg@mail.gmail.com>
References: <5751DA8F.2090708@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=yYOOOos9nqQPihpp+JVPJOknTOM0z1PEdS+3KPJblEM=;
        b=gA0HM861J2YBuv29eqX/4ulk2eqaffhOz4X3WRoMSfInNttROtcGaKIox2WzZBH5A4
         zRgcj+1m0xCnkuzEkn7FUjpSt3ijiAT/0kaQgr2H7dCn3tnQ4nF5J7fan366ILhaloYt
         v0GXLji1oD8WJNRaG0PhnEY7d4HlaIJgkEFixqBhDUTNYGArW0RMl21Satb+c6aLvkxh
         aV6J7qk5Zu1sp/8HsYz/r1MwboiQu32jognVchfNU1sUiAtH4U4WLHlijuMuhqw/St7O
         /ZCzm54IkvwTSvjuX8pz0kKMDe9fRv7dgyb0kU303OuAm2ta4uO14aCoIu2Tga4dxjgR
         eVSg==
In-Reply-To: <5751DA8F.2090708-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Fri, Jun 3, 2016 at 2:29 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
>
> Add items to Devicetree Source Format chapter
>
> - Add naming convention for DTS files and DTS include files
> - Add /include/ compiler directive
> - Add ";" to end of node definition
> - Add /delete-node/ and /delete-property/
> - Add arithmetic, bitwise, and logical expressions
>
> Note that cpp directives are not included in this patch, and
> are not yet specified in this appendix.
>
> Signed-off-by: Frank Rowand <frank.rowand-mEdOJwZ7QcZBDgjK7y7TUQ@public.gmane.org>
> ---
>  source/source-language.rst |   60 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 59 insertions(+), 1 deletion(-)
>
> Index: b/source/source-language.rst
> ===================================================================
> --- a/source/source-language.rst
> +++ b/source/source-language.rst
> @@ -9,6 +9,19 @@ devicetree in the form expected by the k
>  not a formal syntax definition of DTS, but describes the basic
>  constructs used to represent devicetrees.
>
> +The name of DTS files should end with ".dts".
> +
> +Compiler directives
> +-------------------
> +
> +Other source files can be included from a DTS file.  The name of include
> +files should end with ".dtsi".  Included files can in turn include
> +additional files.
> +
> +::
> +
> +    /include/ "FILE"
> +
>  Node and property definitions
>  -----------------------------
>
> @@ -21,11 +34,18 @@ preceded by a label.
>      [label:] node-name[@unit-address] {
>          [properties definitions]
>          [child nodes]
> -    }
> +    };
>
>  Nodes may contain property definitions and/or child node definitions. If
>  both are present, properties shall come before child nodes.
>
> +Previously defined nodes may be deleted.
> +
> +::
> +
> +    /delete-node/ node-name;
> +    /delete-node/ &label;
> +
>  Property definitions are name value pairs in the form:
>
>  ::
> @@ -39,6 +59,12 @@ form:
>
>          [label:] property-name;
>
> +Previously defined properties may be deleted.
> +
> +::
> +
> +    /delete-property/ property-name;
> +
>  Property values may be defined as an array of 32-bit integer cells, as
>  null-terminated strings, as bytestrings or a combination of these.
>
> @@ -48,6 +74,38 @@ null-terminated strings, as bytestrings
>  ::
>
>          interrupts = <17 0xc>;
> +-  values may be represented as arithmetic, bitwise, or logical expressions
> +   within parenthesis.
> +
> +::
> +
> +    Arithmetic operators
> +
> +    +   add
> +    -   subtract
> +    *   multiply
> +    /   divide
> +    <<  left shift
> +    >>  right shift
> +
> +::
> +
> +    Bitwise operators
> +
> +    &&   and
> +    ||   or

Is this correct that these are not logical operators? From the dtc
source in dtc-parser.y, it looks like both bitwise and logical ops are
supported and XOR.

> +
> +::
> +
> +    Logical operators
> +
> +    <    less than
> +    >    greater than
> +    <=   less than or equal
> +    >=   greater than or equal
> +    ==   equal
> +    !=   not equal
> +
>
>  -  A 64-bit value is represented with two 32-bit cells. Example:
>
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
