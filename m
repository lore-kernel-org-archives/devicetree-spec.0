Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692269;
	b=jT472IKTj3tv3D0w3eoEp2Ba5/MU9RHXkh4NwNdP0KvFCJwcW6ZKqB9aBwxPx5y2gBI2
	 /+jWJGVfirRhZ9TYl6QkLzkS7Q7opeRdO+0kRpMK/CHAyHDRJPJV0DCYvkgHEYcE2aw+m
	 cBcywdxuIJy5wAffFvAq5NKhufHsLP1VqE0UVdCGH+f04eFPebtKOEin+AVj0NBYsMsro
	 gW23F09d6w/8lZbRmjCaQL6lJ+VF0QMyUknHoo8Lf5sY70VV3pvQ9oTrh+wElrWXMbG1I
	 3msm6zouDvi7+478FA9/A4IkwzSAGiYgW9qVk7Ubz966fXt+S9nsJRlsD34Vz/KKXiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692269;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=a4Jk1fkHurKDQ5PW6GmEUP4A59s3cfqxk8bzM8SgE/Q=;
	b=Yi3RxnUr7adRCTXnIQ9bSp7N9uvGd/8Byxbwa3v+M5zjtIYWxsQq3MXekLWwtlIFBpB0
	 rmqhJdSVtuSoCZ3ifEyZFBBsugCyS36Ldsh5bUPzDEyif/SzpINWFQzwB9BkvcWEPwdBj
	 uHvy+3a6VUDR2fmzoe29n/sw/JPq6oTvZ/Cw45bMnBA7hAi9d2Ucrr2rgirZ2Ycoljj62
	 QplacXdofpwjIb5Vn+FrzXDdFYQSlTpuloWYb9BmQxb6hEsohITPgIEzaFUo52dKrkTvF
	 xOEsKjCvb0RtS22IUzVz3zOaECnuAsokzN3G7swYSMmJKWhP8z3AMPh7qScvUXHCXxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Yf+ndtT1;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793ED60A3808
	for <devicetree-spec@vger.kernel.org>; Thu, 26 Nov 2026 11:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 793ED60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Yf+ndtT1
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3061F4E4179E;
	Thu, 26 Nov 2026 11:24:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F394160237;
	Thu, 26 Nov 2026 11:24:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 481E511E6B372;
	Thu, 26 Nov 2026 12:24:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692265; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=a4Jk1fkHurKDQ5PW6GmEUP4A59s3cfqxk8bzM8SgE/Q=;
	b=Yf+ndtT1e8rwsGdVdxOcD9f6Qg3ugTDmE90XmztufwjUK7r6HLw+pWMg2AbDvrNMi2irrR
	nQgdAg8IHrEuUhYUaor5FNQbr4QEqdCeSWEErfW9471zyBDxvAL66iG0krIMlZaJKWuieR
	j/nG1Kful1S00IGu4XYjj7p6aV9FAI6tB2HXA3yddvy9bopM+QA/DTneo3rnqJ4gDBn2bX
	pCA6AhhPhbNVF/poY0nCpoMQHWfbstWr3ziqaGD12auMDw02N5OHrrDJAdsqp56R69G3+2
	9eZZJ6OA3SAj69SH56GcrRqtvahu7lc+CjauwEC3oqUixI81/U57cLvXqSYKUw==
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	David Lechner <dlechner@baylibre.com>,
	Ayush Singh <ayush@beagleboard.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	devicetree-compiler@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree-spec@vger.kernel.org,
	Hui Pu <hui.pu@gehealthcare.com>,
	Ian Ray <ian.ray@gehealthcare.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v4 15/22] fdtdump: Handle unknown tags
Date: Thu, 26 Nov 2026 12:22:32 +0100
Message-ID: <20261126112239.636284-16-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126112239.636284-1-herve.codina@bootlin.com>
References: <20261126112239.636284-1-herve.codina@bootlin.com>
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Post: <mailto:devicetree-spec@vger.kernel.org>
List-Help: <mailto:devicetree-spec+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree-spec+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The structured tag value definition introduced recently gives the
ability to ignore unknown tags without any error when they are read.

Add support for those structured tags in fdtdump.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 fdtdump.c                                  |  42 ++++
 tests/run_tests.sh                         |  39 ++++
 tests/unknown_tags_can_skip.fdtdump.expect | 228 +++++++++++++++++++++
 3 files changed, 309 insertions(+)
 create mode 100644 tests/unknown_tags_can_skip.fdtdump.expect

diff --git a/fdtdump.c b/fdtdump.c
index 2f219676..91759973 100644
--- a/fdtdump.c
+++ b/fdtdump.c
@@ -53,6 +53,30 @@ static uint32_t next_cell(const void *blob, uint32_t *off, uint32_t limit)
 	return fdt32_to_cpu(*p);
 }
 
+static uint32_t get_structured_tag_data(uint32_t tag, const char *blob,
+					uint32_t off, uint32_t limit,
+					const char **data, uint32_t *data_size)
+{
+	uint32_t sz;
+
+	sz = FDT_TAG_DLEN_GET(tag);
+	if (sz != FDT_TAG_DLEN_VARLEN) {
+		sz *= sizeof(fdt32_t);
+	} else {
+		/* Get the length */
+		sz = next_cell(blob, &off, limit);
+	}
+
+	if (off > limit || sz > limit - off)
+		die("** End of blob while reading structured tag data\n");
+
+	*data_size = sz;
+	*data = sz ? blob + off : NULL;
+
+	/* Skip the data bytes */
+	return ALIGN(off + sz, 4);
+}
+
 static void dump_blob(void *blob, bool debug)
 {
 	struct fdt_header *bph = blob;
@@ -178,6 +202,24 @@ static void dump_blob(void *blob, bool debug)
 			continue;
 		}
 
+		if (FDT_TAG_IS_SKIPPABLE(tag)) {
+			uint32_t sz, index;
+			const char *d;
+
+			o = get_structured_tag_data(tag, blob, o, totalsize,
+						    &d, &sz);
+
+			printf("%*s// Tag: 0x%08"PRIx32", data len %"PRIu32,
+			       depth * shift, "", tag, sz);
+			if (sz != 0) {
+				printf(" ");
+				for (index = 0; index < sz; index++)
+					printf("%02hhx", *(d + index));
+			}
+			printf("\n");
+			continue;
+		}
+
 		die("** Unknown tag 0x%08"PRIx32"\n", tag);
 	}
 }
diff --git a/tests/run_tests.sh b/tests/run_tests.sh
index a9be92a9..6472c86d 100755
--- a/tests/run_tests.sh
+++ b/tests/run_tests.sh
@@ -227,6 +227,40 @@ check_align () {
     )
 }
 
+# $1: generated file
+# $2: expected file
+check_diff () {
+    printf "check_diff $1 $2:	"
+    local fgen="$1"
+    local fref="$2"
+    (
+        if diff $fref $fgen >/dev/null; then
+            PASS
+        else
+            if [ -z "$QUIET_TEST" ]; then
+                echo "DIFF :-:"
+                diff -u $fref $fgen
+            fi
+            FAIL "Results differ from expected"
+        fi
+    )
+}
+
+# $1: dtb file
+# $2: out file
+wrap_fdtdump () {
+    printf "wrap_fdtdump $1:	"
+    local dtb="$1"
+    local out="$2"
+    (
+        if $FDTDUMP ${dtb} 2>/dev/null >${out}; then
+            PASS
+        else
+            FAIL
+        fi
+    )
+}
+
 run_dtc_test () {
     printf "dtc $*:	"
     base_run_test wrap_test $VALGRIND $DTC "$@"
@@ -1125,6 +1159,11 @@ utilfdt_tests () {
 
 fdtdump_tests () {
     run_fdtdump_test "$SRCDIR/fdtdump.dts"
+
+    base_run_test wrap_fdtdump unknown_tags_can_skip.dtb unknown_tags_can_skip.dtb.out
+    # Remove unneeded comments
+    sed -i.bak '/^\/\/ [^T]/d' unknown_tags_can_skip.dtb.out
+    base_run_test check_diff unknown_tags_can_skip.dtb.out "$SRCDIR/unknown_tags_can_skip.fdtdump.expect"
 }
 
 fdtoverlay_tests() {
diff --git a/tests/unknown_tags_can_skip.fdtdump.expect b/tests/unknown_tags_can_skip.fdtdump.expect
new file mode 100644
index 00000000..8c5809e1
--- /dev/null
+++ b/tests/unknown_tags_can_skip.fdtdump.expect
@@ -0,0 +1,228 @@
+/dts-v1/;
+
+// Tag: 0x8007ffff, data len 4 00000001
+/ {
+    // Tag: 0x8003ffff, data len 0
+    info = "!! Unknown tags are present here and there !!";
+    // Tag: 0x8007ffff, data len 4 00000002
+    // Tag: 0x800bffff, data len 8 0000000300000003
+    // Tag: 0x80ffffff, data len 3 040404
+    node1 {
+        prop1 = "123456789";
+        prop2 = "123456789";
+        prop3 = "123456789";
+        subnode1 {
+            prop;
+        };
+        subnode2 {
+            prop;
+        };
+        subnode3 {
+            prop;
+        };
+    };
+    node2 {
+        prop1 = "123456789";
+        // Tag: 0x8003ffff, data len 0
+        // Tag: 0x80ffffff, data len 3 202020
+        // Tag: 0x8007ffff, data len 4 00000021
+        prop2 = "123456789";
+        // Tag: 0x8003ffff, data len 0
+        // Tag: 0x80ffffff, data len 3 202020
+        // Tag: 0x8007ffff, data len 4 00000021
+        prop3 = "123456789";
+        // Tag: 0x8003ffff, data len 0
+        // Tag: 0x80ffffff, data len 3 202020
+        // Tag: 0x8007ffff, data len 4 00000021
+        subnode1 {
+            prop;
+        };
+        subnode2 {
+            prop;
+        };
+        subnode3 {
+            prop;
+        };
+    };
+    node3 {
+        // Tag: 0x800bffff, data len 8 0000001000000010
+        // Tag: 0x8007ffff, data len 4 00000011
+        prop1 = "123456789";
+        prop2 = "123456789";
+        prop3 = "123456789";
+        subnode1 {
+            prop;
+        };
+        subnode2 {
+            prop;
+        };
+        subnode3 {
+            prop;
+        };
+    };
+    node4 {
+        // Tag: 0x800bffff, data len 8 0000001000000010
+        // Tag: 0x8007ffff, data len 4 00000011
+        prop1 = "123456789";
+        // Tag: 0x8003ffff, data len 0
+        // Tag: 0x80ffffff, data len 3 202020
+        // Tag: 0x8007ffff, data len 4 00000021
+        prop2 = "123456789";
+        // Tag: 0x8003ffff, data len 0
+        // Tag: 0x80ffffff, data len 3 202020
+        // Tag: 0x8007ffff, data len 4 00000021
+        prop3 = "123456789";
+        // Tag: 0x8003ffff, data len 0
+        // Tag: 0x80ffffff, data len 3 202020
+        // Tag: 0x8007ffff, data len 4 00000021
+        subnode1 {
+            prop;
+        };
+        subnode2 {
+            prop;
+        };
+        subnode3 {
+            prop;
+        };
+    };
+    node5 {
+        // Tag: 0x800bffff, data len 8 0000001000000010
+        // Tag: 0x8007ffff, data len 4 00000011
+        prop1 = "123456789";
+        // Tag: 0x8003ffff, data len 0
+        // Tag: 0x80ffffff, data len 3 202020
+        // Tag: 0x8007ffff, data len 4 00000021
+        prop2 = "123456789";
+        // Tag: 0x8003ffff, data len 0
+        // Tag: 0x80ffffff, data len 3 202020
+        // Tag: 0x8007ffff, data len 4 00000021
+        prop3 = "123456789";
+        // Tag: 0x8003ffff, data len 0
+        // Tag: 0x80ffffff, data len 3 202020
+        // Tag: 0x8007ffff, data len 4 00000021
+        subnode1 {
+            // Tag: 0x8007ffff, data len 4 00000030
+            prop;
+        };
+        // Tag: 0x800bffff, data len 8 0000004000000040
+        subnode2 {
+            // Tag: 0x8007ffff, data len 4 00000030
+            prop;
+        };
+        // Tag: 0x800bffff, data len 8 0000004000000040
+        subnode3 {
+            // Tag: 0x8007ffff, data len 4 00000030
+            prop;
+        };
+        // Tag: 0x800bffff, data len 8 0000004000000040
+    };
+    node6 {
+        // [NOP]
+        // Tag: 0x800bffff, data len 8 0000001000000010
+        // [NOP]
+        // Tag: 0x8007ffff, data len 4 00000011
+        // [NOP]
+        prop1 = "123456789";
+        // [NOP]
+        // Tag: 0x8003ffff, data len 0
+        // [NOP]
+        // Tag: 0x80ffffff, data len 3 202020
+        // [NOP]
+        // Tag: 0x8007ffff, data len 4 00000021
+        // [NOP]
+        prop2 = "123456789";
+        // [NOP]
+        // Tag: 0x8003ffff, data len 0
+        // [NOP]
+        // Tag: 0x80ffffff, data len 3 202020
+        // [NOP]
+        // Tag: 0x8007ffff, data len 4 00000021
+        // [NOP]
+        prop3 = "123456789";
+        // [NOP]
+        // Tag: 0x8003ffff, data len 0
+        // [NOP]
+        // Tag: 0x80ffffff, data len 3 202020
+        // [NOP]
+        // Tag: 0x8007ffff, data len 4 00000021
+        // [NOP]
+        subnode1 {
+            // Tag: 0x8007ffff, data len 4 00000030
+            prop;
+        };
+        // Tag: 0x800bffff, data len 8 0000004000000040
+        subnode2 {
+            // Tag: 0x8007ffff, data len 4 00000030
+            prop;
+        };
+        // Tag: 0x800bffff, data len 8 0000004000000040
+        subnode3 {
+            // Tag: 0x8007ffff, data len 4 00000030
+            prop;
+        };
+        // Tag: 0x800bffff, data len 8 0000004000000040
+    };
+    node7 {
+        // [NOP]
+        // Tag: 0x800bffff, data len 8 0000001000000010
+        // [NOP]
+        // Tag: 0x8007ffff, data len 4 00000011
+        // [NOP]
+        prop1 = "123456789";
+        // [NOP]
+        // Tag: 0x8003ffff, data len 0
+        // [NOP]
+        // Tag: 0x80ffffff, data len 3 202020
+        // [NOP]
+        // Tag: 0x8007ffff, data len 4 00000021
+        // [NOP]
+        prop2 = "123456789";
+        // [NOP]
+        // Tag: 0x8003ffff, data len 0
+        // [NOP]
+        // Tag: 0x80ffffff, data len 3 202020
+        // [NOP]
+        // Tag: 0x8007ffff, data len 4 00000021
+        // [NOP]
+        prop3 = "123456789";
+        // [NOP]
+        // Tag: 0x8003ffff, data len 0
+        // [NOP]
+        // Tag: 0x80ffffff, data len 3 202020
+        // [NOP]
+        // Tag: 0x8007ffff, data len 4 00000021
+        // [NOP]
+    };
+    node8 {
+        // [NOP]
+        // Tag: 0x800bffff, data len 8 0000001000000010
+        // [NOP]
+        // Tag: 0x8007ffff, data len 4 00000011
+        // [NOP]
+        subnode1 {
+            // Tag: 0x8007ffff, data len 4 00000030
+            prop;
+        };
+        // Tag: 0x800bffff, data len 8 0000004000000040
+        subnode2 {
+            // Tag: 0x8007ffff, data len 4 00000030
+            prop;
+        };
+        // Tag: 0x800bffff, data len 8 0000004000000040
+        subnode3 {
+            // Tag: 0x8007ffff, data len 4 00000030
+            prop;
+        };
+        // Tag: 0x800bffff, data len 8 0000004000000040
+    };
+    node9 {
+        // [NOP]
+        // Tag: 0x800bffff, data len 8 0000001000000010
+        // [NOP]
+        // Tag: 0x8007ffff, data len 4 00000011
+        // [NOP]
+    };
+    // Tag: 0x80ffffff, data len 4 05050505
+};
+// Tag: 0x8007ffff, data len 4 00000006
+// Tag: 0x80ffffff, data len 2 0707
-- 
2.56.1

