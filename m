From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] Fix changebar pdf build and add to Travis releases
Date: Fri, 15 Dec 2017 16:46:12 -0600
Message-ID: <CAL_Jsq+G6+o8OyZvQRk9VuJNzrZbx-Csbp2QVBtj4LwP4HT_MQ@mail.gmail.com>
References: <20171215141912.14414-1-grant.likely@arm.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215141912.14414-1-grant.likely-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>

On Fri, Dec 15, 2017 at 8:19 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> Fix the changebar build caused by a bad interaction between Sphinx and
> latexdiff. latexdiff was not doing the right thing for changes in
> chapter headers due to "red" and "blue" getting uppercased to "RED" and
> "BLUE", and creating invalid output when adding some verbatim sections.
> Fixed by moving to latest latexdiff and adding sphinxVerbatim to the
> VERBATIMENV config variable.
>
> Also update the travis-ci control file to also build the changebar
> version of the document.
>
> Cc: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> Signed-off-by: Grant Likely <grant.likely-5wv7dgnIgG8@public.gmane.org>
> ---
> Hi Rob,
>
> I've not figured out how to test this yet. I'll ping you on IRC about running it through its paces before committing the patch.

I fixed up an issue with wget and a missing package dependency and pushed.

Rob
