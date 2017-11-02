From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Next steps for schema language
Date: Thu, 2 Nov 2017 16:44:01 +0000
Message-ID: <CACxGe6s98i_T_ehHihUow9OL513Oiaof2hPLyQRe2ELgkCTx=g@mail.gmail.com>
Mime-Version: 1.0
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=secretlab-ca.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=CQ33gGHo9FHZAwHNudNECK+8UaZyxN9TE3HEPinWvRo=;
        b=sTsiJj+sCJPoTVi/srg4AQUpWzX1eq/nq+iAaKDwajbX3LlDqaBzbkTAQ4RFJXv/8c
         xV4Rmr43Fh8Np0xBXuUMTP+lcc58Ak0P3y76dV1d461HE9U1rIt0Q/UuYrDTF68ATo9U
         LrSOkI+WJ+PUbg0Ws8WSqGZwTx4FH//KZrgVrIA+sPGQLFOtlZt36xIsNt7sZ1ZhQ+ro
         JkSRDPe1wLv39bNoKg4QTCkL2SJ9fBDNK+qnk1X+NK4V+r3dUL+n/e+k/l4YlzOMFQb+
         TwthJU4I0FJW82sZ9Q0EoQfDc+uCpcsGQxPrk2zyMAR8v7D8uxMlHuEUHD4yE7/g/VYH
         mEwQ==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi Pantelis and Rob,

After the workshop next week, I'm trying to capture the direction
we're going for the schema format. Roughly I think we're aiming
towards:

- Schema files to be written in YAML
- DT files shall remain written in DTS for the foreseeable future.
YAML will be treated as an intermediary format
  - That said, we'll try to make design decisions that allow YAML to
be used as a source format.
- All schema files and yaml-encoded-dt files must be parsable by stock
YAML parsers
- Schema files to use the jsonschema vocabulary
  - (jsonschema assumes json files, but YAML is a superset so this will be okay)
  - Extended to add vocabulary for DT concepts (ignored by stock validators)
    - C-like expressions as used in Pantelis' yamldt could be added in this way
  - Need to write a jsonschema "metaschema" do define DT specific extensions
    - metaschema will be used to validate format of schema files
    - Existing tools can confirm is schema files are in the right format.
    - will make review a lot easier.

The yaml encoding produced by yamldt is a good start, but some changes
need to be made from the current code to be workable:
- The redefinition of the anchor/alias syntax needs to be dropped.
  - We need a labels/reference syntax instead.
  - I'm using a $labels property to contain a list of labels which is
working for me, but I'm open to other suggestions
  - A YAML style !phandle or !path type definition would work for
parsing references.
- At the top level, the yaml-encoded-dt needs to be structured as a
list, not a map.
  - Using a list will properly accounts for how multiple top level
trees are overlayed to create the final tree.
  - I'm using a $path property to encode the path of each top level
node. Again, I'm open to suggestions for a different approach

Pantelis, do you think you can rework yamldt to use that encoding?

I'm currently working on what is needed for a metaschema, and an
engine for validating device-specific schema files using a standard
jsonschema validation library. I'll post a git tree once I've got
something worth looking at.

Cheers,
g.
