Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589E338DC3
	for <devicetree-spec@vger.kernel.org>; Thu,  9 Nov 2023 23:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5EB84239
	for <devicetree-spec@vger.kernel.org>; Thu,  9 Nov 2023 15:12:36 -0800 (PST)
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3b566ee5f1dso808941b6e.0
        for <devicetree-spec@vger.kernel.org>; Thu, 09 Nov 2023 15:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699571555; x=1700176355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YgW8bPv0dE+He+bFx8Q4eFDgd3YPzWtDTJu32GYC/DI=;
        b=XP0HCbOmmYrwRWln577mVBDZvWOOkFopz6Y2s5IBRVr/nlsEC7o+lnR0AO+/Qmyznm
         xH7WjIugc7eg85DGBOMkxA3s5LnJDS7kj7J0Klajxlkn8E9u9sz+XOilmzaMnoBxMTah
         k82m5AFgMW3tr3MkFBqn2MQBow+96AOHcDNMlXgOnMVhiNIC07IT2yScxsrqG80QrVf9
         PLXwXJl06Yw+ozag3Z9Fx+anVq82dp7HswD6DHMpPtH/U/NM5jrcFk1iah0p7dv4wP8P
         MbRL0zWS06nVqoYEvEsG8TMe3MWZcxr2ZBd0AmPteQDMBqTBV+rbkhtlbv6Aa1STmSVE
         fdgQ==
X-Gm-Message-State: AOJu0YyiLs6i7oCTAyNf/pKy5mRGolJVNycjvpe/N9kmhvkUa5Uo9DBS
	uZ4cewlbuP03KDlPSPVTAmeqWkigOA==
X-Google-Smtp-Source: AGHT+IFzXZchtxzWHfqy5hmxj72v354UK0FtIRQhWxRdQHV1GKXRWnf32jJ6PaEMQhWNxQmpEmCXXA==
X-Received: by 2002:a05:6808:f8a:b0:3a7:6b1c:8142 with SMTP id o10-20020a0568080f8a00b003a76b1c8142mr3850916oiw.25.1699571554775;
        Thu, 09 Nov 2023 15:12:34 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 24-20020aca0918000000b003b2ef9778absm137464oij.46.2023.11.09.15.12.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 15:12:34 -0800 (PST)
Received: (nullmailer pid 2426727 invoked by uid 1000);
	Thu, 09 Nov 2023 23:12:33 -0000
From: Rob Herring <robh@kernel.org>
To: devicetree-spec@vger.kernel.org
Subject: [dtschema PATCH] tools: Add tool to compare schemas for ABI changes
Date: Thu,  9 Nov 2023 17:12:33 -0600
Message-ID: <20231109231233.2426715-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new tool which compares 2 sets of schemas for possible ABI changes.
It's not complete nor 100% accurate, but it's a start.

This checks for the following kinds of changes:

- New required properties
- Minimum number of entries required increased
- Removed properties

Limitations:

Restructuring of schemas may result in false positives or missed ABI
changes. There's some support if a property moves from a schema to a
referenced schema.

Schemas underneath logic keywords (allOf, oneOf, anyOf) or if/then/else schemas
are not handled.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 pyproject.toml      |   1 +
 tools/dt-cmp-schema | 135 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 136 insertions(+)
 create mode 100755 tools/dt-cmp-schema

diff --git a/pyproject.toml b/pyproject.toml
index 6fc9bb7ae4b9..da5fcca421ce 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -36,6 +36,7 @@ Source="https://github.com/devicetree-org/dt-schema"
 
 [tool.setuptools]
 script-files = [
+    'tools/dt-cmp-schema',
     'tools/dt-check-compatible',
     'tools/dt-validate',
     'tools/dt-doc-validate',
diff --git a/tools/dt-cmp-schema b/tools/dt-cmp-schema
new file mode 100755
index 000000000000..25ac3dd05274
--- /dev/null
+++ b/tools/dt-cmp-schema
@@ -0,0 +1,135 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: BSD-2-Clause
+# Copyright 2023 Arm Ltd.
+
+import sys
+import argparse
+import signal
+import urllib
+
+import dtschema
+
+
+def _sigint_handler(signum, frame):
+    sys.exit(-2)
+
+
+signal.signal(signal.SIGINT, _sigint_handler)
+
+
+def path_list_to_str(path):
+    return '/' + '/'.join(path)
+
+
+def prop_generator(schema, path=[]):
+    if not isinstance(schema, dict):
+        return
+    for prop_key in ['properties', 'patternProperties']:
+        if prop_key in schema:
+            for p, sch in schema[prop_key].items():
+                yield path + [prop_key, p], sch
+                yield from prop_generator(sch, path=path + [prop_key, p])
+
+
+def _ref_to_id(id, ref):
+    ref = urllib.parse.urljoin(id, ref)
+    if '#/' not in ref:
+        ref += '#'
+    return ref
+
+
+def _prop_in_schema(prop, schema, schemas):
+    for p, sch in prop_generator(schema):
+        if p[1] == prop:
+            return True
+
+    if 'allOf' in schema:
+        for e in schema['allOf']:
+            if '$ref' in e:
+                ref_id = _ref_to_id(schema['$id'], e['$ref'])
+                if ref_id in schemas:
+                    if _prop_in_schema(prop, schemas[ref_id], schemas):
+                        return True
+
+    if '$ref' in schema:
+        ref_id = _ref_to_id(schema['$id'], schema['$ref'])
+        if ref_id in schemas and _prop_in_schema(prop, schemas[ref_id], schemas):
+            return True
+
+    return False
+
+
+def check_removed_property(id, base, schemas):
+    for p, sch in prop_generator(base):
+        if not _prop_in_schema(p[1], schemas[id], schemas):
+            print(f'{id}{path_list_to_str(p)}: existing property removed\n', file=sys.stderr)
+
+
+def schema_get_from_path(sch, path):
+    for p in path:
+        try:
+            sch = sch[p]
+        except:
+            return None
+    return sch
+
+
+def check_new_items(id, base, new, path=[]):
+    for p, sch in prop_generator(new):
+        if not isinstance(sch, dict) or 'minItems' not in sch:
+            continue
+
+        min = sch['minItems']
+        base_min = schema_get_from_path(base, p + ['minItems'])
+
+        if base_min and min > base_min:
+            print(f'{id}{path_list_to_str(p)}: new required entry added\n', file=sys.stderr)
+
+
+def _check_required(id, base, new, path=[]):
+    if not isinstance(base, dict) or not isinstance(new, dict):
+        return
+
+    if 'required' not in new:
+        return
+
+    if 'required' not in base:
+        print(f'{id}{path_list_to_str(path)}: new required properties added: {", ".join(new["required"])}\n', file=sys.stderr)
+        return
+
+    diff = set(new['required']) - set(base['required'])
+    if diff:
+        print(f'{id}{path_list_to_str(path)}: new required properties added: {", ".join(diff)}\n', file=sys.stderr)
+        return
+
+
+def check_required(id, base, new):
+    _check_required(id, base, new)
+
+    for p, sch in prop_generator(new):
+        _check_required(id, schema_get_from_path(base, p), sch, path=p)
+
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser(description="Compare 2 sets of schemas for possible ABI differences")
+    ap.add_argument("baseline", type=str,
+                    help="Baseline schema directory or preprocessed schema file")
+    ap.add_argument("new", type=str,
+                    help="New schema directory or preprocessed schema file")
+    ap.add_argument('-V', '--version', help="Print version number",
+                    action="version", version=dtschema.__version__)
+    args = ap.parse_args()
+
+    base_schemas = dtschema.DTValidator([args.baseline]).schemas
+    schemas = dtschema.DTValidator([args.new]).schemas
+
+    if not schemas or not base_schemas:
+        sys.exit(-1)
+
+    for id, sch in schemas.items():
+        if id not in base_schemas or 'generated' in id:
+            continue
+
+        check_required(id, base_schemas[id], sch)
+        check_removed_property(id, base_schemas[id], schemas)
+        check_new_items(id, base_schemas[id], sch)
-- 
2.42.0

