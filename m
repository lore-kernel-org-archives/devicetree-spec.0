Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kegq7Lnw"
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D145E6
	for <devicetree-spec@vger.kernel.org>; Sat,  2 Dec 2023 10:33:30 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-50bce42295eso3825495e87.2
        for <devicetree-spec@vger.kernel.org>; Sat, 02 Dec 2023 10:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701542008; x=1702146808; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=69nqhpvpbyR0pCN6vpJnnjnIXllX3m0pZ+3/5o4uKow=;
        b=kegq7Lnwo1ELqrYeEIzmgGArVSAmiOPLImP6bRl6Mj4IsKeOgB04vutS+EjyTZzk4T
         0jdO86Pci6OhCoXCYup0pF3Se+Z0RN21AYEYxuyuX4/sp1VX/HNoVTWwhg7KXMX6l0nr
         z9er+WzvNIU1MAgLoiRGbuNUk3g1hQE9LGVmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701542008; x=1702146808;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69nqhpvpbyR0pCN6vpJnnjnIXllX3m0pZ+3/5o4uKow=;
        b=aMm3Tz5dm8eFxNHwRmVAGZFN2ohjlPET0NP/857HzbSSryT0H02XECEFOBU8mUjt1c
         28u6t/2obC7yoLmhuterf0rA2Nrq9q9RYQcE8r3z9gh+oXrc2d+DXrpwagNhmFYXpcfo
         gc78NDSB5ovxgqfNukxn2ne4fcrWa48Asf6Li7eYEk2rlWMobdUfnJx71pqll0FRUbFY
         ISTcw5xeuN5aph6a8FSFWBIVdaWjun9sQOsMhzBcFVUH2uNjmc3fRul92ROJIgaEj4ID
         wAHa1m/wAW9gMuqj6OTtOIyeEMTdGlN03ehEoeSnPNhf+b02MjVpfa+u/spv6aV6HQcy
         ZQgQ==
X-Gm-Message-State: AOJu0YxiKbJS7wVr3mmi/rlVTLlB4dyBtWCA9MQ1ll6yz6CV+vnu/sEQ
	mLF2ZzEgSlF3iCuaHnHcYujfprdd2Mv7sopEtp7qKGSJ93ZRyTCIyrcjjg==
X-Google-Smtp-Source: AGHT+IEcgDHUjSVLY0v9P/dZMp4eaILO5yyZvoU0OWsO1stZMRcB93Mlh1RBxkmk/SkjFH35wkr3PJyh1rEco5lhXGE=
X-Received: by 2002:ac2:563b:0:b0:50b:d764:881e with SMTP id
 b27-20020ac2563b000000b0050bd764881emr1749687lff.106.1701542007989; Sat, 02
 Dec 2023 10:33:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231109231233.2426715-1-robh@kernel.org>
In-Reply-To: <20231109231233.2426715-1-robh@kernel.org>
From: Simon Glass <sjg@chromium.org>
Date: Sat, 2 Dec 2023 11:33:11 -0700
Message-ID: <CAPnjgZ2sFYV4ybjZhUkNOtGiVtqQboBUsMdagiu7eV0EpWMfRQ@mail.gmail.com>
Subject: Re: [dtschema PATCH] tools: Add tool to compare schemas for ABI changes
To: Rob Herring <robh@kernel.org>
Cc: devicetree-spec@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Rob,

On Thu, 9 Nov 2023 at 16:12, Rob Herring <robh@kernel.org> wrote:
>
> Add a new tool which compares 2 sets of schemas for possible ABI changes.
> It's not complete nor 100% accurate, but it's a start.
>
> This checks for the following kinds of changes:
>
> - New required properties
> - Minimum number of entries required increased
> - Removed properties
>
> Limitations:
>
> Restructuring of schemas may result in false positives or missed ABI
> changes. There's some support if a property moves from a schema to a
> referenced schema.
>
> Schemas underneath logic keywords (allOf, oneOf, anyOf) or if/then/else schemas
> are not handled.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  pyproject.toml      |   1 +
>  tools/dt-cmp-schema | 135 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 136 insertions(+)
>  create mode 100755 tools/dt-cmp-schema
>

Would it be possible to add some comments, a test and some
documentation updates?

> diff --git a/pyproject.toml b/pyproject.toml
> index 6fc9bb7ae4b9..da5fcca421ce 100644
> --- a/pyproject.toml
> +++ b/pyproject.toml
> @@ -36,6 +36,7 @@ Source="https://github.com/devicetree-org/dt-schema"
>
>  [tool.setuptools]
>  script-files = [
> +    'tools/dt-cmp-schema',
>      'tools/dt-check-compatible',
>      'tools/dt-validate',
>      'tools/dt-doc-validate',
> diff --git a/tools/dt-cmp-schema b/tools/dt-cmp-schema
> new file mode 100755
> index 000000000000..25ac3dd05274
> --- /dev/null
> +++ b/tools/dt-cmp-schema
> @@ -0,0 +1,135 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: BSD-2-Clause
> +# Copyright 2023 Arm Ltd.
> +
> +import sys
> +import argparse
> +import signal
> +import urllib
> +
> +import dtschema
> +
> +
> +def _sigint_handler(signum, frame):
> +    sys.exit(-2)

Shouldn't this be 2 ?

> +
> +
> +signal.signal(signal.SIGINT, _sigint_handler)
> +
> +
> +def path_list_to_str(path):
> +    return '/' + '/'.join(path)
> +
> +
> +def prop_generator(schema, path=[]):
> +    if not isinstance(schema, dict):
> +        return
> +    for prop_key in ['properties', 'patternProperties']:
> +        if prop_key in schema:
> +            for p, sch in schema[prop_key].items():
> +                yield path + [prop_key, p], sch
> +                yield from prop_generator(sch, path=path + [prop_key, p])
> +
> +
> +def _ref_to_id(id, ref):
> +    ref = urllib.parse.urljoin(id, ref)
> +    if '#/' not in ref:
> +        ref += '#'
> +    return ref
> +
> +
> +def _prop_in_schema(prop, schema, schemas):
> +    for p, sch in prop_generator(schema):
> +        if p[1] == prop:
> +            return True
> +
> +    if 'allOf' in schema:
> +        for e in schema['allOf']:
> +            if '$ref' in e:
> +                ref_id = _ref_to_id(schema['$id'], e['$ref'])
> +                if ref_id in schemas:
> +                    if _prop_in_schema(prop, schemas[ref_id], schemas):
> +                        return True
> +
> +    if '$ref' in schema:
> +        ref_id = _ref_to_id(schema['$id'], schema['$ref'])
> +        if ref_id in schemas and _prop_in_schema(prop, schemas[ref_id], schemas):
> +            return True
> +
> +    return False
> +
> +
> +def check_removed_property(id, base, schemas):
> +    for p, sch in prop_generator(base):
> +        if not _prop_in_schema(p[1], schemas[id], schemas):
> +            print(f'{id}{path_list_to_str(p)}: existing property removed\n', file=sys.stderr)
> +
> +
> +def schema_get_from_path(sch, path):
> +    for p in path:
> +        try:
> +            sch = sch[p]
> +        except:
> +            return None
> +    return sch
> +
> +
> +def check_new_items(id, base, new, path=[]):
> +    for p, sch in prop_generator(new):
> +        if not isinstance(sch, dict) or 'minItems' not in sch:
> +            continue
> +
> +        min = sch['minItems']
> +        base_min = schema_get_from_path(base, p + ['minItems'])
> +
> +        if base_min and min > base_min:
> +            print(f'{id}{path_list_to_str(p)}: new required entry added\n', file=sys.stderr)
> +
> +
> +def _check_required(id, base, new, path=[]):
> +    if not isinstance(base, dict) or not isinstance(new, dict):
> +        return
> +
> +    if 'required' not in new:
> +        return
> +
> +    if 'required' not in base:
> +        print(f'{id}{path_list_to_str(path)}: new required properties added: {", ".join(new["required"])}\n', file=sys.stderr)
> +        return
> +
> +    diff = set(new['required']) - set(base['required'])
> +    if diff:
> +        print(f'{id}{path_list_to_str(path)}: new required properties added: {", ".join(diff)}\n', file=sys.stderr)
> +        return
> +
> +
> +def check_required(id, base, new):
> +    _check_required(id, base, new)
> +
> +    for p, sch in prop_generator(new):
> +        _check_required(id, schema_get_from_path(base, p), sch, path=p)
> +
> +
> +if __name__ == "__main__":
> +    ap = argparse.ArgumentParser(description="Compare 2 sets of schemas for possible ABI differences")
> +    ap.add_argument("baseline", type=str,
> +                    help="Baseline schema directory or preprocessed schema file")
> +    ap.add_argument("new", type=str,
> +                    help="New schema directory or preprocessed schema file")
> +    ap.add_argument('-V', '--version', help="Print version number",
> +                    action="version", version=dtschema.__version__)
> +    args = ap.parse_args()
> +
> +    base_schemas = dtschema.DTValidator([args.baseline]).schemas
> +    schemas = dtschema.DTValidator([args.new]).schemas
> +
> +    if not schemas or not base_schemas:
> +        sys.exit(-1)

You can use required=True in add_argument(). Otherwise I suggest
raise() or adding a message so the user can see what is wrong.

> +
> +    for id, sch in schemas.items():
> +        if id not in base_schemas or 'generated' in id:
> +            continue
> +
> +        check_required(id, base_schemas[id], sch)
> +        check_removed_property(id, base_schemas[id], schemas)
> +        check_new_items(id, base_schemas[id], sch)
> --
> 2.42.0
>
>

Regards,
Simon
