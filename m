Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC24524C
	for <devicetree-spec@vger.kernel.org>; Sun, 23 Mar 2025 13:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742735333; cv=none; b=UxEor5qA89w1PHhLvKuBN8RRvu0z6TS8baOrsOI95GuC/2oTCOGr8SPVIQJ3LgxaQCWeaHt07htcn64dmzy3itFbFn+2YGQMKwgen/95o9/ImUdOTEPMNAYddN55eo/e6CAgacltZaiir+I35ulrFq1wzSs8V5FI3ILcs6olyIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742735333; c=relaxed/simple;
	bh=I8/tzofWCl8yjkUOT/MuCPqbEzjGMBmhNmXzlHwCrak=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A0yFxfOE6YLxCkVWXwQy7zV9xu9ZJd39yL6ufyvUKXdc3NjBwMUeXRZGoEW+NtdhXpnVCFbJBW7kuCqajzd+TOBWhNJBQC/LY6bPWaE4S4vZ3gy+Ai29LqDemATfzbRBsSxuUF5QyznQa0e7V4q50VulmHNDPg6UpdPs2QK7wSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=cdE/ZP3x; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="cdE/ZP3x"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-30185d00446so4280737a91.0
        for <devicetree-spec@vger.kernel.org>; Sun, 23 Mar 2025 06:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1742735330; x=1743340130; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aXXPl385iWUaFhTVSPPmfVTDwXySkpGIodtZfIoktCQ=;
        b=cdE/ZP3xlmmHovTlFIB5NDi0/OVzaSVPHpjpHApHFxpbyv3vDaE0gadeoVVpzZ7gJD
         Tbdj3ArR9fS5rUYRSO8YdAwDqIZNvqcw1V+XHhKg9vPjT1/helzxeRfliVqqQCYQj7Y+
         EJb/T9kgovjzEO0S7uh++GGcRexmlnR00ocBNFTwehFMAvnt8gqdrO4Ngb1e0vJkBv2G
         PaiDSkFg8ysJg/Zbu/cZjzjh8HimqSOAAFf44MhPXwg+7Ahx/Q3d57n/ajpLfTajNsdV
         YLRABHeMvCnCiAs9E/cCbMwJ/CZprOrW3NngikmegP3iJapXUjsHrA4Hi6scBNR52V94
         gAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742735330; x=1743340130;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXXPl385iWUaFhTVSPPmfVTDwXySkpGIodtZfIoktCQ=;
        b=DSb3mv8N6V5ZFRS0f2iU1pQf1SuOG8Nq+VzKauZNjOFh6JDzYgob6IHUK4GoJYPyII
         MeFh50/kGkJmvPXgtXUzBzRYYUbfbC+uyD0xG4s9FQamGl4DvUnj1yFlPfOgZtiBHXoK
         vbpQJosJD6KSywnwWaSrP6YHCaIyZtr8LQK4bDzY57YwwW1XyjIG4iLjt9bT+REJ8zm5
         aHp73hV2QxVt8ISJpqwJe/pu5UAAr8Gw2wD8iNXU/N+vsL91Rz1x4SlppXNB7Ij+ZH75
         ZRDujBqBmedbOd3V3IMGOGELYd3fXvhhUL6KsVlHgaQ8n8ybzN8tjzQ0yqCBVSlqOQeH
         TJNw==
X-Gm-Message-State: AOJu0YxpdCkkEqJBDaaFHWY7MFIyORP0u/nFwG38OMYlKsQfs+9zonnG
	K2fiAAT1eXB6zGkjpRyG+gNqbnv/vc6UPmAZn+VjF65a0cG+Ps53pDb4NFWt5Q==
X-Gm-Gg: ASbGncuii3FtrbjCWhH62M/6Z0ga66BMiFSY78TJKQzNtzPKFPyXo2RSSMHugP+ZAfS
	iU6i4RVjjtkv39joeH6ah6V7261YDnvhXftcTStgltFeP9vFwZK4X2nmtQGAqjBhP3+AP5rHsyA
	WnbRKqZsZ1p7pgNw1Vs8zlcFGVhhtt21cNfQz7ytgqHoHRRO9Nr3wZdh+V3zLpHWMwYGO+XzxJa
	Pm5Mxmqe047TmkH6uQERZNZwqFpnpjH83IGgou4KG5x0EzoY4eo7GirafdEuwZmi2m8oRjhP04J
	J0o4IKbuSa2D59UYPcq22Q0RJKeL+1wX/Mj40mY6VmV+o1+AaNvM
X-Google-Smtp-Source: AGHT+IF5H/2WzUE7xtUZMI1jbvXfhFUV6K9BdNdli/47tKs052tkzIeohkNL/HvN4QwQhIjnnxyEJg==
X-Received: by 2002:a17:90b:544f:b0:2ff:5267:e7da with SMTP id 98e67ed59e1d1-3030e5509f2mr16066935a91.3.1742735330244;
        Sun, 23 Mar 2025 06:08:50 -0700 (PDT)
Received: from [172.22.56.137] ([117.250.76.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af8a28003b2sm5167401a12.28.2025.03.23.06.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 06:08:49 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sun, 23 Mar 2025 18:37:27 +0530
Subject: [PATCH v2] Add new `export-symbols` node
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250323-export-symbols-v2-1-f0ae1748b244@beagleboard.org>
X-B4-Tracking: v=1; b=H4sIAI4H4GcC/3XMQQ6CMBCF4auQWVvTTkGtK+9hWLQwlCZIyZQQC
 OHuVvYu/5e8b4dEHCjBs9iBaQkpxDEHXgpoejt6EqHNDSixkoiVoHWKPIu0fVwcktAVlp3Csmm
 NhnyamLqwnuC7zt2HNEfeTn9Rv/UvtSihxM1oWRrSpB73lyPrB3LRcnuN7KE+juMLR1ArRLIAA
 AA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11252;
 i=ayush@beagleboard.org; h=from:subject:message-id;
 bh=I8/tzofWCl8yjkUOT/MuCPqbEzjGMBmhNmXzlHwCrak=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBn4AfNigvNDjJ9ricdjHOgolS8N7aXwCXQaBnQX
 GuOLBf9k6+JAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZ+AHzQAKCRAFzvXHieVa
 dLHYEADJ6iEKOW9SFLz+QZ9oDkZW32/TEZo3ki0hyKXI9+ALb+PsKzbLR3To8wPq7elX6UAtNg1
 KRRTP3ZdLFrILXhKRCtBUuypT18LJpFjBj5D8cdpT7bqJuOnGzqqbGwCw3elVyw5f5SBSO4kFnE
 aTHM+NNtKP30nQqfnX0pasq4OjZyDJFkvQS3u1bxT6eIZEIEcXt87zVvOf65ggLwmJzi/TjWeZR
 M755e1VlDhyRaytsc1+GgoOq1nocLwMMIQZxei5Xob/CGvRXR9UgpQUhTwF+Fv4F8pun4U8bMvs
 RihpLP3c4owwXpwH+4iksHAtUpn0m/Fuy4G2Oiq99nAV57hQsE81+MNrJ+AoHiaKeRYXh2KrbVh
 VqJ1m69UuZpynEtpXv9BqfnRYlmJKKzmeXQgAeDAna5D5wMs+rJa5ytVdQQV4eT6P/rwwLNsESs
 M4mGxGduJ5xsvj2svlLs3bAydNjbX3CPz0/jjDO1ChLLJzhR1fJvDPmxK8bRl/GY2oGS2krGtMM
 O9ttht6DK/Zd0YHmZ/Yl60w5+aYvgdLPS5AjHQfYPpLQ4x9xvKOPawILnT4GaBYx+kAQ+8V348J
 4B7rOk48yXJshiXkgWk2eNzQ0+q4PHqkBxpxvDzwmYPQBis/TP98vMaX03EwVEttMKQoV+VBn3l
 HKuMoKlXxWY07Fw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74

`export-symbols` is designed to be a local replacement of global
`__symbols__` allowing nodes to define aliases to nodes in a tree, which
will take precedence over the aliases defined in the global `__symbols__`.

Having a way to allow node local aliases helps in usecases such as
connectors and addon-boards, by allowing decoupling of
overlays/devicetree nodes of addon-board from the base connector.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
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

Linux kernel already provides APIs to apply overlays at specific nodes
[10], and I have a patch series to have similar functionality in
fdtoverlay [11]. This is to allow writing overlays for addon-boards,
that will be expected to be applied to the connector nodes, instead of
on the global tree.

One of the issue was referencing resources available on the base board
device tree from the addon overlay device tree. Using a nexus node [3]
helps decoupling some resources like GPIO and PWM from the overlay.
However, that still leaves things like pinmux, i2c adapter, etc.

The `export-symbols` node solves this issue.

The idea of export-symbols is to have something similar to the global 
`__symbols__` node but local to a specific node. Symbols listed in this
export-symbols are local and visible only when an overlay is applied on a
node having an export-symbols subnode. This allows specifying the
phandles to i2c adapter, pinmux, etc, per connector. Since the names
used for these phandles for each connector can be standardized, it would
allow having the same addon-board overaly work for connectors on
different boards (or multiple connectors on the same board).

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
	    GPIO_CONNECTOR = <&connector1>;
	    PIN_33_GPIO_PINMUX = <&p1_33_gpio>;
        };
    };

Our overlay can use thi

   leds {
      pinctrl-names = "default";
      pinctrl-0 = <&PIN_33_GPIO_PINMUX>;

      led-1 {
          gpios = <&GPIO_CONNECTOR 33 GPIO_ACTIVE_HIGH>;
      };
   };

It used the P1_33 pin in the connector it is applied on.

A board with two connectors can be described with:

    connector1: connector1 {
        ...
        export-symbols {
	    GPIO_CONNECTOR = <&connector1>;
	    PIN_33_GPIO_PINMUX = <&p1_33_gpio>;
        };
    };

    connector2: connector2 {
        ...
        export-symbols {
	    GPIO_CONNECTOR = <&connector2>;
	    PIN_33_GPIO_PINMUX = <&p3_33_gpio>;
        };
    };

In that case, the same overlay with unresolved `GPIO_CONNECTOR` and 
`PIN_33_GPIO_PINMUX` symbol can be applied on both connectors and the 
correct symbol resolution will be done.

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
[10]: https://docs.kernel.org/devicetree/kernel-api.html#c.of_overlay_fdt_apply
[11]: https://lore.kernel.org/devicetree-compiler/20250313-fdtoverlay-target-v1-0-dd5924e12bd3@beagleboard.org/T/#t

Best Regards,
Ayush Singh
---
Changes in v2:
- Improve examples. More focus on export-symbols and less on nexus nodes
- Fix typo.
- Link to v1: https://lore.kernel.org/r/20250225-export-symbols-v1-1-693049e3e187@beagleboard.org
---
 source/chapter3-devicenodes.rst | 89 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenodes.rst
index 8080321d6e60d6b1e86c81af86c6850246a0223b..2c3bbc2c81bacd71fcf3b389a31237344f995ba7 100644
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
+(`*/export-symbols`) that defines one or more export-symbol properties.
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

