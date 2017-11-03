From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: Next steps for schema language
Date: Fri, 3 Nov 2017 08:59:16 -0500
Message-ID: <CAL_JsqK1rtc81+=vzc36w4MRmQGYXBeib+QCj0TxtxEMVN2bKQ@mail.gmail.com>
References: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Thu, Nov 2, 2017 at 11:44 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
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

I want to start small here with defining top-level board/soc bindings.
This is essentially just defining the root node compatible strings.
Seems easy enough, right? However, I quickly run into the problem of
how to match for when to apply the schema. "compatible" is the obvious
choice, but that's also what I'm checking. We can't key off of what we
are validating. So we really need 2 schema. The first is for matching
on any valid compatible for board, then 2nd is checking for valid
combinations (e.g. 1 board compatible followed by 1 SoC compatible). I
don't like that as we'd be listing compatibles twice. An alternative
would be we apply every board schema and exactly 1 must pass. Perhaps
we generate a schema that's a "oneOf" of all the boards? Then we just
need to tag board schemas in some way.

I'm thinking of this very specific case, but no doubt it is going to
apply in other places. This has been one of the harder problems with
writing dtc checks. What to key off of to trigger checks and how to
check errors in the key itself.

Rob
