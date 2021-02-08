From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Node name & property name collusion - json/yaml implications
Date: Mon, 8 Feb 2021 09:01:57 -0600
Message-ID: <CAL_Jsq+e7JjDJTAkDJj_6bcc70QZSZ3cP8012TE7QEf3+sid3Q@mail.gmail.com>
References: <C008DF92-364E-4892-A1C0-68A2C97BE946@linaro.org> <20210206071131.GA61463@yekko.fritz.box>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612796530;
        bh=XCysozDhU3fbnXl3KtUfCIC0Qx0fIVcHEy0d0q2wnR4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=LZVBn5fd0VmIXKiIhoisbBlSwjZwzQQqkwX5p0vO2eGV/WryFNtbARZoc0e26n7RD
         sAttzx7NUsnYF25W4lKBanNFvozPYvKUgukvNg+JbbpugjtXIr+FbBRzG3rZdbUHUi
         fqKOkCtgpf6N8WSLkRq2UdnKOY+nuOS5mvVkEYtQLaIaRbMFCYYZ+LeF7ju0ihbf4u
         0ad88RQJJgTVekg1mx+fGhWZwcXjdO0SBgdLm49qCdMC6yzUL/zt/1WzzNlBQcY0sO
         hpFiM1r7yhXOcvVcoWXHT2zEE7kohWIafp8FG4tTdd0P3RohbcvRMCyY8lK423/C19
         L652/0dgvQq5Q==
In-Reply-To: <20210206071131.GA61463-l+x2Y8Cxqc4e6aEkudXLsA@public.gmane.org>
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org>
Cc: Kumar Gala <kumar.gala-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "Bolivar, Marti" <Marti.Bolivar-hR+23Fw+YnFSHonuZl5R5Q@public.gmane.org>, Grant Likely <Grant.Likely-5wv7dgnIgG8@public.gmane.org>, Rob Herring <Rob.Herring-5wv7dgnIgG8@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Sat, Feb 6, 2021 at 1:26 AM David Gibson <david-xT8FGy+AXnRB3Ne2BGzF6laj5H9X9Tb+@public.gmane.org> w=
rote:
>
> On Fri, Feb 05, 2021 at 06:57:54AM -0600, Kumar Gala wrote:
> > There=E2=80=99s an old thread about this from 2016:
> >
> > https://www.spinics.net/lists/devicetree-spec/msg00296.html
>
> That is not the only case of this - IIRC old Apple machine device
> trees had both an 'l2-cache' property and an 'l2-cache' node under
> each CPU node.

According to a dump I have, '/cpus/PowerPC,G4' has 'l2-cache' property
and '/cpus/PowerPC,G4/PowerPC,G4' node has a node name of 'l2-cache'.
So this would actually work with yaml if we brought back explicit
'name' properties. But this highlights we've already diverged from
OpenFirmware.

Specs evolve all the time deprecating old behavior. I don't see this
as any different. We can debate deprecating vs. outright changing the
spec. It's so rare, do we need to even bother deprecating it?

Rob
