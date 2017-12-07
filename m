From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] Extract document version from git tag
Date: Thu, 7 Dec 2017 11:01:21 -0600
Message-ID: <CAL_JsqKs1RLVrsidNG2GEdTj10VmoDGkmrK05X-1-NP4-wtnUw@mail.gmail.com>
References: <20171207163306.24679-1-grant.likely@arm.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171207163306.24679-1-grant.likely-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

On Thu, Dec 7, 2017 at 10:33 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> Instead of hard coding the document version in the config file, use
> 'git describe' to get the version number from the tags and use that.
> Just like before, if the version string contains a '-', then it is not
> an official release and a watermark will be added to the PDF. This
> catches prereleases "-pre*", untagged revisions "-g<hash>", and
> uncommitted changes "-dirty".
>
> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
> ---
>  source/conf.py | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

Nice!

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
