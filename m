From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Clarify DTB section preable
Date: Fri, 15 Dec 2017 17:12:18 -0800
Message-ID: <0c680c53-f9a8-186b-a319-458565fa2116@gmail.com>
References: <20171212110836.31537-1-grant.likely@arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9I8Ie3N9mxkmB96q2Uvlc/bcr1eVss65LnQa6xERhmE=;
        b=AgU1zcXjgvyPYLMPi5FCxSGM6sYPiDjeM15ReZarz60PtcseIP5QnzS8nQSCx3T5le
         FaXa35kcBORX3xJNb4B2hA8E3FNZN3nS/4Rx1sXPAY2jJlncsyrr56Jzq1j9mfsKi864
         e4KRLTpGUnp2tw1wEEy5gzr8Qvj8n4k42ZQ5e/T+aScdRjIYMXl93yN7W4YwNtEWiQsz
         tjfc4QZoUDBgUeKTY9sxfNL80zag9kwDTZ6pTGzotCDpgHZmOYKUltKY5w1+Qu7cMDCb
         UwjH4QewvnxgNzRaoMVyXCs7mbNIGiXVh/gt32lesUi5yGoRNlrV09TzGWif5LgcmWy1
         6lQg==
In-Reply-To: <20171212110836.31537-1-grant.likely-5wv7dgnIgG8@public.gmane.org>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

On 12/12/17 03:08, Grant Likely wrote:
> The DTB chapter used to be titled the "Flattened Devicetree Structure"
> chapter, but that seems to be unclear when it is talking about a
> specific encoding of devicetree. In this case, the encoding is 'dtb'.
> The source format chapter specifies "DTS", so change the start of this
> chapter to line up with the DTS chapter.
> 
> At the same time, update the introduction to include the source format
> chapter.
> 
> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
> ---
>  source/flattened-format.rst | 17 ++++++++++++-----
>  source/source-language.rst  |  2 +-
>  2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/source/flattened-format.rst b/source/flattened-format.rst
> index a1c358e..bd98891 100644
> --- a/source/flattened-format.rst
> +++ b/source/flattened-format.rst
> @@ -1,13 +1,20 @@
>  .. _chapter-fdt-structure:
>  
> -Flat Devicetree Physical Structure
> +Flattened Devicetree (DTB) Format
>  ==================================
>  
> -With the exception of platforms using IEEE1275 Open Firmware [IEEE1275], the
> -devicetree data is contained within a single, linear, pointerless data structure
> -known as the flattened devicetree or devicetree blob.
> +The Devicetree Blob (DTB) format is a flat binary encoding of devicetree data.


> +It used to exchange devicetree data between software programs.> +For example, when booting an operating system, firmware will pass a DTB to the OS kernel.

That wording is vague enough to allow the imaginative reader plenty of room
to jump to false conclusions.  For example, someone with a BIOS background
might assume that the kernel can use the blob to communicate to the boot loader.

The wording at the start of the 4th paragraph on p. 4 (the "Relationship to
IEEE 1275 and ePAPR" section) is more clear and precise:

"... concepts from the devicetree architecture by which a boot program can
describe and communicate system hardware information to client program, thus eliminating the need for the client
program to have hard-coded descriptions of system hardware."

I would suggest to either not add the two sentences in the patch, or else to
model them to be more like the wording on p. 4.

>  
> -This data structure consists of a small header
> +.. note::
> +
> +   IEEE1275 Open Firmware [IEEE1275] does not define the DTB format.
> +   On most Open Firmware compliant platforms the devicetree is extracted by calling firmware methods
> +   to walk through the tree structure.
> +
> +The DTB format encodes the devicetree data within a single, linear, pointerless data structure.
> +It consists of a small header
>  (see section :ref:`sect-fdt-header`),
>  followed by three variable sized sections:
>  the memory reservation block (see section :ref:`sect-fdt-memory-reservation-block`),
> diff --git a/source/source-language.rst b/source/source-language.rst
> index fd6f8af..8dd9710 100755
> --- a/source/source-language.rst
> +++ b/source/source-language.rst
> @@ -1,6 +1,6 @@
>  .. _chapter-devicetree-source-format:
>  
> -Devicetree Source Format (version 1)
> +Devicetree Source (DTS) Format (version 1)
>  ================================================
>  
>  The Devicetree Source (DTS) format is a textual representation of a
> 
