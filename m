Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968881DFDE
	for <devicetree-spec@vger.kernel.org>; Tue, 25 Feb 2025 06:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740463383; cv=none; b=G86wdrbg4tcyPAn+Zr0QhLJtfPvD5uc3ha7pvqfNWiC6sNExuXHs/kT8I8nOx+duSlUrLHYind+heNVnpyhTa0K+Tj7F8rzNYLDz+jRCWK5JjzNGvB6yLJ4R3VaIzVYKQuaOgzl1lIOFpmTVNFPDTtOzVUV5JFir+NBT9nKWxy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740463383; c=relaxed/simple;
	bh=hCch3GGwWR/XxT0Jrz2kF8+UYBNQp2N4cw9R1PpVPM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=fRjVd38Q5TA14kUviOc+b56377vSbbhOIEZ06iI5f9jbM2JrwrIIgSxIE6jWa5B038o+Ll6jr8jwYchloLTYlZac8TPetWlO/QsDaXz3IWjcVyoCpHJuoF8hDofBN3YQPCgQI4ShCHDx9ELeSIxLw+eg0mFVGl9T06M99uy5h/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=jUIdV0nw; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="jUIdV0nw"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2211acda7f6so115862905ad.3
        for <devicetree-spec@vger.kernel.org>; Mon, 24 Feb 2025 22:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1740463381; x=1741068181; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0C6viWcIiYSNNYaRW1T087dXeM5W5uNs0zNIT6rUI5M=;
        b=jUIdV0nwCJslV3UKQoqifa6b7YC574C4mT0Yc1He7FAqcK6EAjSQrlWpZSjHYmleAf
         IwKkM8QXQW2AmEY+comx1XwkBw4sSbCIoLO3O0vG5U0L2OKgO3lJrty3f+vUeihG5af7
         3X3gttHpmRo7nPJysrVYb/cWOUpzDnMI9U2yXGlhgKmV1N0QCWfa/if5Z9t10GVEhbdV
         V/TIZx5Ozo48r0jiLRW6rsITltH+Sis5ZPe7Z4iH4iEBi3456Z9bYvjwZO9pg36/zebZ
         6MqsVqyn4AudDRvLixYhhn+gQ2Lm64EuIPl9QfbrCpZ4fgqesbV4wZKACo1PBpZxMfek
         bVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740463381; x=1741068181;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0C6viWcIiYSNNYaRW1T087dXeM5W5uNs0zNIT6rUI5M=;
        b=gVqDuaGEQWwzxshE3KM5LwXHD6novkADC2WbREV/61vxgNWy6ovuS8yZigOs/wSAuJ
         be/1VQ0WgS368C/pPQ10cQfi7mFZXJQ5SnBS5IxwZfRWZscYj5nR6EJftuqZCqPJ9JqK
         bE8KJaxo4UoXBtVJIRf8bhFa90JEmB30IZx1/gySF9+pmOySldX+rlZPcXM162S3dtXr
         Wa4ge+x6vZdx3nbroRHryeKwgjsKC1soopkmWVC0FvcuBNbkrDtLN5E7Y0aGDh/fMhWY
         1V117pI/G/oK1t/uOHK3G5t0B9flxQuWi6f6rFD94z+CM0RzJauGbE9c8MeLtKtt+qrp
         IS0Q==
X-Gm-Message-State: AOJu0YzLMmEhhhqEwgee4Z+B57o2CcCWYGgG2ui5+V/rw9I7ms8rcyNI
	HyEuyed2BNq+3oFemmONEDVgfAYnUuIjItHWtLm7mP+VWWvFDQuFNZfwNmNnUQ==
X-Gm-Gg: ASbGncsh1x4RdL3AbrVQ6xMGnakFavCLZ21zFuMG3xJONQ0mVGSys9NSeDT+tX9ar05
	R3nyhUnWbquxg/9o0gyuBidASJEqRHI3Isu3yMJiXTPn/a/9OFT9XBRxi/bjayInagVGFOFftIj
	/AbACVpmdaE55J9CpI70fswu6PvTW7tCPuFQ5tvOXeREKuLGDHJJmNu5FhlB65QOsztXNCBKHC8
	3+tbybCUhk4ty0dCeePBacEEgvbb48+HamP4a+xA3cg+feXV6dkOFt/linaTHTVeqK8Z7r7tXWo
	oHopBrRlaGBP0VrGjUoaC2cKPv2M7ixRdQ==
X-Google-Smtp-Source: AGHT+IFsZHyMePyDFAEDX1V2tJC23BWout2U4FFdzHEEgDddVvir3P3enTMYxfwpFjOGzZQ7rxjG0A==
X-Received: by 2002:a17:902:d4cf:b0:220:e338:8d2 with SMTP id d9443c01a7336-2219ff4ecc0mr227736165ad.21.1740463380613;
        Mon, 24 Feb 2025 22:03:00 -0800 (PST)
Received: from [172.16.119.211] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a0a63fdsm5999965ad.209.2025.02.24.22.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 22:02:59 -0800 (PST)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 25 Feb 2025 11:32:21 +0530
Subject: [PATCH] Add new `export-symbols` node
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250225-export-symbols-v1-1-693049e3e187@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIAOxcvWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNT3dSKgvyiEt3iytyk/JxiXWNTI5M0QyOT5BRLYyWgpoKi1LTMCrC
 B0bG1tQBU+Y6qYAAAAA==
X-Change-ID: 20250225-export-symbols-3524f124cd93
To: Jason Kridner <jkridner@beagleboard.org>, 
 Deepak Khatri <lorforlinux@beagleboard.org>, 
 Robert Nelson <robertcnelson@beagleboard.org>, nenad.marinkovic@mikroe.com, 
 Andrew Davis <afd@ti.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Robert Nelson <robertcnelson@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>, 
 David Gibson <david@gibson.dropbear.id.au>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Grant Likely <grant.likely@secretlab.ca>, Dhruva Gole <d-gole@ti.com>
Cc: devicetree-spec@vger.kernel.org, Ayush Singh <ayush@beagleboard.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11596;
 i=ayush@beagleboard.org; h=from:subject:message-id;
 bh=hCch3GGwWR/XxT0Jrz2kF8+UYBNQp2N4cw9R1PpVPM0=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBnvV0MWTS66Pywj10jMSQWZOlNWda4vYKBM7gW0
 CR3lSw205yJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ71dDAAKCRAFzvXHieVa
 dBNNEACb2Ft/qJSENN2vgUvyXgefbzTKs2uk9LrohPaJvbTyc/e5CqRzbyGGujuJQuoYybJdWme
 V4cq748xbCZTmmqpaQgeoAY50H/W31fg1r22oozCx9PaKGkAg1iGjn3UllvayTLHS8zf5yQNWC5
 P+okxmJfz/QJV10KJJGb5RjP46/V5CaK66rdjD4RJBaw1WJz7KJ1jrhl8o2hqiWy64E9AlhBvpU
 04lodDpVly6nMrwteODuOQaSHTujOhbUnNqZAAp8sAfX3LmuaDvBBr0KkrX+7bYiq1jjbIKhb8B
 tmGtUv0b5eKaC9GE5PUymYjq/fVU95EQeEv+H5bme2nxlAvowqUsHx9p5dSVplPDMKXMvH0kGqv
 A/2s9h0QFLN7kxArI/AAvvOk9c6Mtj4o9tpBGX89/WGmMZswBukChrTmFbr50mBfkILgp6CNqFu
 0hN8jqzMSICHUsRTXGSkVJ5+FPIprvoJ6hqBx3ta0mOotqbopH7T/KzYX1XtfDn5+ByGJNVKn4H
 4yYd79ryJ4hVmu54OeHFqk9nQiJp7c0hrL8bOpGY0xsG+YEcGZAW+vgSyACPJlFT6kS3B4WFa/c
 zGMbMb4u8QOn8ZSJSejbHGIXvHG4ngTnn01OvXdYgrNG2QCKmA2MyGX3IHEF9kFH0oQIyhwzCnI
 1GdD/sF0os1QdAQ==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

`export-symbols` is designed to be a local replacement of global
`__symbols__` allowing nodes to define aliases to nodes in a tree, which
will take precedence over the aliases defined in the global `__symbols__`.

Having a way to allow node local aliases helps in usecases such as
connectors and addon-boards, by allowing decoupling of
overlays/devicetree nodes of addon-board from the base connector.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
This patch series follows the initial RFC [9] sent a few weeks ago. I
will be reiterating the RFC here for anyone who might be seeing this the
first time, since there was not much feedback in that thread.

The patch series adds export-symbols to base devicetree specification to
allow for support of base board + runtime connector setups using devicetree
overlays. The idea was actually proposed in the linux kernel mailing list
by Herve Codina [0] with the devicetree schema and linux kernel
implementation. Initial implementations for devicetree compiler [1] and
fdtoverlay [2] have also been sent to the mailing lists.

Introduction
*************

There are a lot of setups, especially in embedded systems that consist of
a base connector and addon boards that can be connected to this connector.
Here are some examples:
- MikroBus
- GE SUNH
- BeagleCapes, etc

Some of these connectors have runtime detection capabilities (GE SUNH),
while some do not (MikroBUS without 1-wire EEPROM). The goal is to decouple 
the connector on base device tree with the overlay for addon boards. This
will allow having 1 overlay for each board that would work with connector
devicetree on any board.

One of the issue was referencing resources available on the base board
device tree from the addon overlay device tree. Using a nexus node [3]
helps decoupling resources and avoid the knowledge of the full base board
from the overlay. Indeed, with nexus node, the overlay need to know only
about the nexus node itself.

For instance, suppose a connector where a GPIO is connected at PinA. On the
base board this GPIO is connected to the GPIO 12 of the SoC GPIO controller.

The base board can describe this GPIO using a nexus node:

    soc_gpio: gpio-controller {
      #gpio-cells = <2>;
    };

    connector1: connector1 {
        /*
         * Nexus node for the GPIO available on the connector.
         * GPIO 0 (Pin A GPIO) is connected to GPIO 12 of the SoC gpio
         * controller
         */
        #gpio-cells = <2>;
        gpio-map = <0 0 &soc_gpio 12 0>;
        gpio-map-mask = <0xf 0x0>;
        gpio-map-pass-thru = <0x0 0xf>;
    };

The connector pin A GPIO can be referenced using:

  <&connector1 0 GPIO_ACTIVE_HIGH>

This implies that the overlay needs to know about exact label that
references the connector. This label can be different on a different board
and so applying the overlay could fail even if it is used to describe the
exact same addon board. Further more, a given base board can have several
connectors where the exact same addon board can be connected. In that case,
the same overlay cannot be used on both connector. Indeed, the connector
labels have to be different.

The `export-symbols` node solves this issue.

The idea of export-symbols is to have something similar to the global 
`__symbols__` node but local to a specific node. Symbols listed in this
export-symbols are local and visible only when an overlay is applied on a
node having an export-symbols subnode.

Note: `export-symbols` properties differ from __symbols__ since they are
phandles, not path references. This is much easier to work with in
overlays as described in [7].

Using export-symbols, our example becomes:

    soc_gpio: gpio-controller {
      #gpio-cells = <2>;
    };

    connector1: connector1 {
        /*
         * Nexus node for the GPIO available on the connector.
         * GPIO 0 (Pin A GPIO) is connected to GPIO 12 of the SoC gpio
         * controller
         */
        #gpio-cells = <2>;
        gpio-map = <0 0 &soc_gpio 12 0>;
        gpio-map-mask = <0xf 0x0>;
        gpio-map-pass-thru = <0x0 0xf>;

        export-symbols {
          connector = <&connector1>;
        };
    };

With that export-symbols node, an overlay applied on connector1 node can
have the symbol named 'connector' resolved to connector1. Indeed, the 
`export-symbols` node available at connector1 node is used when the overlay
is applied. If the overlay has an unresolved 'connector' symbol, it will be
resolved to connector1 thanks to export-symbols.

Our overlay using the nexus node can contains:

   node {
      foo-gpio = <&connector 0 GPIO_ACTIVE_HIGH>;
   };

It used the GPIO 0 from the connector it is applied on.

A board with two connectors can be described with:

    connector1: connector1 {
        ...
        export-symbols {
          connector = <&connector1>;
        };
    };

    connector2: connector2 {
        ...
        export-symbols {
          connector = <&connector2>;
        };
    };

In that case, the same overlay with unresolved 'connector' symbol can be
applied on both connectors and the correct symbol resolution (connector1
or connector2) will be done.

Alternatives
*************

Some alternative approaches that were considered:

1. Using aliases.

   Currently, it is not possible to update aliases in device tree overlays.
   I sent a patch a few weeks ago to add this support [4]. However, as was
   outlined by Rob, this can break existing drivers that used the unused
   indexes for devices not present in the aliases list.

2. Add support for phandles in `__symbols__`

   This has been discussed in the following patch series [5]. However,
   since there is no way to distinguish between strings and phandles in
   devicetree (everything is bytestring), the type guessing is awkward.
   Also, the export-symbol solution is much more flexible than extending
   the old `__symbols__` node.

3. Add support for path reference resolution to overlays

   An approach using `__symbols__` was proposed by Andrew Davis [6].
   However, currently, it is difficult to support path reference resolution
   support to overlays [7]. This limitation makes it difficult to support
   connector chaining (MikroBUS -> Grove -> Addon board), which is possible
   in some connectors.

Some other benefits to export-symbols
**************************************

1. No need to enable generation of all symbols in base devicetree
   Since the nodes used by connector are referenced by properties in
   `export-symbols`, the symbols table entries for these nodes will be
   generated, even if symbols generation is not enabled globally. This
   can help save space, specially in constrained devices.

2. Enables scoping symbol resolution
   Does not pollute the global symbols, and can be useful outside addon
   board setups.

Why add to specification?
**************************

I would like the ability to share the addon board overlays with
ZephyrRTOS, which also has boards that support MikroBUS (like BeagleConnect
Freedom [8]) and U-Boot. So it would make more sense if this node is part
of the specification instead of linux specific.

[0]: https://lore.kernel.org/all/20241209151830.95723-1-herve.codina@bootlin.com/
[1]: https://lore.kernel.org/all/20250110-export-symbols-v1-1-b6213fcd6c82@beagleboard.org/
[2]: https://lore.kernel.org/devicetree-compiler/86a7a08c-d81c-43d4-99fb-d0c4e9777601@beagleboard.org/T/#t
[3] https://github.com/devicetree-org/devicetree-specification/blob/v0.4/source/chapter2-devicetree-basics.rst#nexus-nodes-and-specifier-mapping
[4]: https://lore.kernel.org/all/20241110-of-alias-v2-0-16da9844a93e@beagleboard.org/T/#t
[5]: https://lore.kernel.org/devicetree-compiler/44bfc9b3-8282-4cc7-8d9a-7292cac663ef@ti.com/T/#mbbc181b0ef394b85b76b2024d7e209ebe70f7003
[6]: https://lore.kernel.org/lkml/20240702164403.29067-1-afd@ti.com/
[7]: https://lore.kernel.org/devicetree-compiler/6b2dba90-3c52-4933-88f3-b47f96dc7710@beagleboard.org/T/#m8259c8754f680b9da7b91f7b7dd89f10da91d8ed
[8]: https://www.beagleboard.org/boards/beagleconnect-freedom
[9]: https://lore.kernel.org/devicetree-spec/edaa1378-c871-4c55-ab99-21ef6656f35a@beagleboard.org/T/#mc339a0ae0c886ca46da0f7bb679518fa8b0b3007

Best Regards,
Ayush Singh
---
 source/chapter3-devicenodes.rst | 89 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenodes.rst
index 8080321d6e60d6b1e86c81af86c6850246a0223b..c525eec7c5cd30a5ba933b4c0592c6a16cb14f6a 100644
--- a/source/chapter3-devicenodes.rst
+++ b/source/chapter3-devicenodes.rst
@@ -988,3 +988,92 @@ each with their own on-chip L2 and a shared L3.
             };
         };
     };
+
+``*/export-symbols`` node
+-------------------------
+A devicetree node may have an export-symbols child node
+(`*/export-symbols`) that defines one of more export-symbol properties.
+
+Each property of the `export-symbols` node defines an alias local to it's
+parent. The property name specifies the alias name. The property value
+specifies the phandle to a node in the devicetree. For example, the
+property ``serial0 = <&main_uart0>`` defines ``serial0`` as the local alias
+to ``main_uart0``.
+
+Alias names shall be lowercase text strings of 1 to 31 characters from the
+following set of characters.
+
+.. tabularcolumns:: | c p{8cm} |
+.. table:: Valid characters for alias names
+
+   ========= ================
+   Character Description
+   ========= ================
+   0-9       digit
+   a-z       lowercase letter
+   \-        dash
+   ========= ================
+
+An alias value is a phandle to a node in the devicetree.
+
+Resolution of nodes using `export-symbols` follows the following rules
+depending on the context:
+
+No target involved
+~~~~~~~~~~~~~~~~~~~
+Properties of parent node use symbols from ``export-symbols``, but none of
+the subnodes will be able to use them. For example, the following code will
+resolve properly:
+
+.. code-block:: dts
+
+    / {
+        parent {
+            led = <&local_gpio 0 GPIO_ACTIVE_HIGH>;
+
+            export-symbols {
+                local_gpio = <&gpio0>;
+            };
+        };
+    }
+
+However, the code below is not valid:
+
+.. code-block:: dts
+
+    / {
+        parent {
+            child {
+                /* child node cannot access export-symbols */
+                led = <&local_gpio 0 GPIO_ACTIVE_HIGH>;
+            };
+
+            export-symbols {
+                local_gpio = <&gpio0>;
+            };
+        };
+    }
+
+Target is used in the base devicetree or overlays
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+Any node/subnode property is free to use symbols from ``export-symbols``
+defined in the parent. To provide a concrete exampe, the following is
+valid:
+
+.. code-block:: dts
+
+    / {
+        parent {
+            export-symbols {
+                local_gpio = <&gpio0>;
+            };
+        };
+    }
+
+    &parent {
+        led = <&local_gpio 0 GPIO_ACTIVE_HIGH>;
+
+        child {
+            led = <&local_gpio 0 GPIO_ACTIVE_HIGH>;
+        };
+    };

---
base-commit: 5688e1c0b961d2ca5a32e3b624a9f4a9b433184f
change-id: 20250225-export-symbols-3524f124cd93

Best regards,
-- 
Ayush Singh <ayush@beagleboard.org>

