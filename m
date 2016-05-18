From: Warner Losh <imp-uzTCJ5RojNnQT0dZR+AlfA@public.gmane.org>
Subject: Re: DTS license for non-linux use
Date: Wed, 18 May 2016 16:31:50 -0600
Message-ID: <CANCZdfpd5n8j9cLKrkT=1yYy1WCPfsdEFNFSF7XBADXE2x9Tyw@mail.gmail.com>
References: <573CE609.2030007@gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:cc;
        bh=N1tnTeRChoKSi5icEqIHE8AsSmcs56rFOfTtxH3H9Bs=;
        b=h4e15+T3pIu6wbdRUudrorhSMAk8D95KoY+Jh/83Txs3OEQEMrJqV05tDXwe9seJTV
         fx6xu4mYIt4qpy4AadmbZDIto40UlkyLjyc1CW69esFeg2Lz7hNGEF52Pj1853zgO3iE
         aQ7ZeQEEVEHSUXV5e6EkuvHQyMyPLAQvhRWkywBiqvSOf4mAKTVO+KocoE2diKaSNf1H
         z2h64kX6gDmFpUc40FsEWyPXGOiA84ocJ6wJHAeTS3UfC3q9YJyDD+I0t3Fs1r0ZVRnd
         NuLJWuDJrDz0ibz4SruiY+ceFv8drl07rxL/9FNxVoRZa/4Bla0mwd8O7QKlc89GJmqj
         T5mg==
In-Reply-To: <573CE609.2030007-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, May 18, 2016 at 4:00 PM, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Warner Losh asked a question about the use of cpp #include in dts
> source files, and while the topic of license of existing devicetree
> source files in the linux source tree has a bearing on the question,
> he adeptly tried to avoid stirring up a hornet's nest.  Instead of
> sidetracking his thread with license issues, this is a new thread
> with my license question.
>
> I'm sure I'll regret asking this, but what the heck.
>
> The result of compiling a devicetree source file (.dts and .dtsi)
> generates a .dtb file aka devicetree blob aka flattened device
> tree (FDT).  The FDT is a binary and ascii data structure that
> contains no code.  If the devicetree source file(s) license is
> gpl, then it seems to me that the license of the blob is also
> gpl.
>
> If an operating system kernel "reads" an FDT, would that somehow
> be a license, copyright, or other issue if the kernel was not also
> gpl licensed?
>
> My naive, "I'm not a lawyer", view is that there would not be
> an issue, but my third hand impression is that the BSDs are
> concerned that there may be an issue.
>
> Are there any good authoritative sources that have addressed
> this issue or a similar issue?

My belief, based on my layman's understanding of the law, is that
the DTB would be a separate work. Using the DTB by the kernel
would not infect the kernel any more than running a GPL'd binary.
It's my belief that the extent to which the dts files are a creative
work, then the resulting DTB would be covered under the licenses
for each file. For the overwhelming majority of users, this is an
acceptable situation since the exposure for releasing the DTB
source is low. And most of the source can be produced by
dtc outputting dts format anyway. As this question hasn't been
litigated to my knowledge, we have to follow similar precidents
like arguing an analogy to an executable. One could also argue
that it's similar to ACPI in that it loads a blob from elsewhere, then
interprets the blob based on a fixed set of rules.

Since dts is purely descriptive of the hardware, an argument
could be made that it's not creative enough to enjoy copyright
protection. The bar is usually pretty low to get copyright
protection, but many cases that had novel aggregations of
facts failed to gain copyright protection because you can't
copyright facts. So that makes it an open question, since it
hasn't been litigated. On the other hand, there are several
examples of works that are barely creative at all that have
copyright protection. For certainty, thought, I'd prefer a
definitive answer in the form of a legal opinion. It would be
better from the BSD community's perspective if there were
an explicit license that was more like BSDL than GPL,
but I understand the sensitivities in other communities may
not allow that. Such a license, though, would render this point
moot.

I'd be interested if anybody has an expert legal opinion
that's been prepared on the topic as well.

Warner
