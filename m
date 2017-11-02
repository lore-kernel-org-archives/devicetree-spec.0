From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Thu, 02 Nov 2017 20:13:47 +0200
Message-ID: <1509646427.5500.6.camel@hp800z>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qjgnaXntAu+b1CPmQdzAbVXQbqPvYA09M8xJAyr1buA=;
        b=a8H7Uil7S1Xx5pYIQJf/wkEAoknrSxcqc7f+sq8flLyALHasEYTUMQrageIuchAGSV
         kjKqsO68MekaftniPx25QXn6+y9dDlWHWksHV9YTUujMldPGzFHmP1LPZ6dspOBDr5KV
         er7zUSMTKy0voiyZFNtYEQkziopmSutI0b/mo=
In-Reply-To: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Grant,

Mostly agree, some notes below.

On Thu, 2017-11-02 at 16:44 +0000, Grant Likely wrote:
> Hi Pantelis and Rob,
> 
> After the workshop next week, I'm trying to capture the direction
> we're going for the schema format. Roughly I think we're aiming
> towards:
> 
> - Schema files to be written in YAML
> - DT files shall remain written in DTS for the foreseeable future.
> YAML will be treated as an intermediary format
>   - That said, we'll try to make design decisions that allow YAML to
> be used as a source format.
> - All schema files and yaml-encoded-dt files must be parsable by stock
> YAML parsers
> - Schema files to use the jsonschema vocabulary
>   - (jsonschema assumes json files, but YAML is a superset so this will be okay)
>   - Extended to add vocabulary for DT concepts (ignored by stock validators)
>     - C-like expressions as used in Pantelis' yamldt could be added in this way
>   - Need to write a jsonschema "metaschema" do define DT specific extensions
>     - metaschema will be used to validate format of schema files
>     - Existing tools can confirm is schema files are in the right format.
>     - will make review a lot easier.
> 
> The yaml encoding produced by yamldt is a good start, but some changes
> need to be made from the current code to be workable:
> - The redefinition of the anchor/alias syntax needs to be dropped.
>   - We need a labels/reference syntax instead.
>   - I'm using a $labels property to contain a list of labels which is
> working for me, but I'm open to other suggestions

I'm working on supporting just that. Should be ready for testing in a
couple of days. Do note that I think we should keep the old '*' usage
for supporting the binding files that are YAML.

>   - A YAML style !phandle or !path type definition would work for
> parsing references.

!phandle is a bad name IMO. It assumes that the implementation is going
to always be a cell integer containing a phandle. I think !ref is
better. Note that we must come with a way to encode types in JSON, since
they are not natively supported.

> - At the top level, the yaml-encoded-dt needs to be structured as a
> list, not a map.
>   - Using a list will properly accounts for how multiple top level
> trees are overlayed to create the final tree.


This is true only for non-resolved files. Resolved files are going to
be guaranteed a map. Does this cause problems for your validator?

>   - I'm using a $path property to encode the path of each top level
> node. Again, I'm open to suggestions for a different approach
> 

A bare scalar that starts with / can always be deduced to be a path.
Can you share some examples about your usage?

> Pantelis, do you think you can rework yamldt to use that encoding?
> 

Yes, it's no big problem.

> I'm currently working on what is needed for a metaschema, and an
> engine for validating device-specific schema files using a standard
> jsonschema validation library. I'll post a git tree once I've got
> something worth looking at.
> 

Please do.

> Cheers,
> g.

Regards

-- Pantelis

