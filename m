From: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Fri, 3 Nov 2017 13:02:13 -0700
Message-ID: <2754ddd0-b666-6117-0a8b-22ac0e622e6a@gmail.com>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=5xRjWxTL27yq6/IhbVLS5L4vo37In6ztXisSvdl9k+A=;
        b=uDL9xhm/NP4+8kHTwj8vZo6d7Ge09DeKF+f6HQCS0T7HRkbMPpUd9EV76bEF1/3Yxo
         8TUBkG4DRVNRT8FOjAUlT6nj4PafyJWCuw1xXJkg176adgsL+ckDw+IfG5cOQX7kePVk
         b2aKHoOwhi7qzkQjFM+AdqvZ0ii+35AiuMr0jcfXYO7xhP6wyKdD3HMEu3drBgNcaPSm
         OZ0R1Q8SifxQEWWtj+VGCabVqWJtbD/PyLuyNSA7YFXtjnCND/MhGGQKsi9sMbILSlGK
         +QzJoZBLDIJzGnbvxp43SxhYDF+HTjeb084cEkqAAAQWcgvnwCise/941kJDnBthAdwI
         /uEQ==
In-Reply-To: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
Content-Language: en-US
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

+me

On 11/02/17 09:44, Grant Likely wrote:
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
>   - A YAML style !phandle or !path type definition would work for
> parsing references.
> - At the top level, the yaml-encoded-dt needs to be structured as a
> list, not a map.
>   - Using a list will properly accounts for how multiple top level
> trees are overlayed to create the final tree.
>   - I'm using a $path property to encode the path of each top level
> node. Again, I'm open to suggestions for a different approach
> 
> Pantelis, do you think you can rework yamldt to use that encoding?
> 
> I'm currently working on what is needed for a metaschema, and an
> engine for validating device-specific schema files using a standard
> jsonschema validation library. I'll post a git tree once I've got
> something worth looking at.
> 
> Cheers,
> g.
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree-spec" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
