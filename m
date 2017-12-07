From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Force Travis-CI to use sphinx 1.5.6
Date: Thu, 7 Dec 2017 09:26:28 -0600
Message-ID: <CAL_Jsq+1ThzqQn44AHjE_K6TXsK=p23gqY7AsaLELrGU=FDCdg@mail.gmail.com>
References: <20171207133942.5810-1-grant.likely@arm.com> <CACxGe6vu68M9eiJLDH+9=1hy+qvcBM=+G_eiHJXpXvwXXC5=Gg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6vu68M9eiJLDH+9=1hy+qvcBM=+G_eiHJXpXvwXXC5=Gg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

On Thu, Dec 7, 2017 at 8:15 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> On Thu, Dec 7, 2017 at 1:39 PM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
>> Sphinx versions 1.6.1 and later have switched to using the mklatex
>> script which seems to interact badly with the graphviz output and the
>> graphics end up being too wide. Until a fix can be found, force Travis
>> CI to use the older release of Sphinx.
>>
>> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
>> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
>> ---
>>
>> Rob, can you try this out and see if it solves the image size problem on Travis CI?
>
> Oh, wait. You've already fixed this in the main tree. I only just did
> a git update. Sorry for the noise.

Next time it breaks, I'm just going to fix the version. :)

Rob
