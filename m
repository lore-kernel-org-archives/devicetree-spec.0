Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB9C2C692
	for <devicetree-spec@vger.kernel.org>; Fri,  5 Jan 2024 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIAsKmAu"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e3ab65709so1342645e9.3
        for <devicetree-spec@vger.kernel.org>; Fri, 05 Jan 2024 03:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704454581; x=1705059381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQM2vFmzcHkwceC1T1r7uAAzcPJsF9zYe+9VdLJEVjY=;
        b=RIAsKmAui5ARiMOx4KypcxDjXXWPnbniCbkdOLXP6QPx0/v9fNCMMWYMIu6qr7t1Tv
         0BnK0jYi9HJ7WsCDiSRn8POP0c5S5STisUTDw/+JbfeFxbVVk6tqjvm5uepQNni2yTTV
         SsxB2s9ycIm4bEnmPMUkb1lIf6yxdQyGNxoVu5qFAay/jsiSmTLq36swOPWDU0b8vBRB
         xS6DLdtwOgeZmU9/N6WTbi7ycObGtsxIHYy0xUbCoWVP/XKIiZBJaKfCztVoGZein3p5
         k9EXTK2jC0fZjWmpYpKcQDvC8ojrZjyJJCsu5v/738TvPAAHbhpAd1Q5S7HnXAADR93F
         EkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704454581; x=1705059381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zQM2vFmzcHkwceC1T1r7uAAzcPJsF9zYe+9VdLJEVjY=;
        b=xQ+P2gIN1Jr0t3qAOJFm6Jura2mTtddjfjVF0Gt7dWKbQy6ej0hTsz/3/KglxYgmFV
         Tjz/E6TjNWv8GKjdB0TkdNUu59QPkRuQiFhwE4jVyTIRMa6mxMxEO2ghFQz6rElMA94k
         HMUEmUJi2fqe1tRfrpU1RLw53GTGoKSq1/zhnQ0ljakOCfc9vw6FbdaVCLWZ7DCgdchs
         U4ACvgMMoScL+om+TyACMK421R7YY7sbCiXMIxC+dCbGxMxQJgUU+sV9lyINNla9TQH0
         GynT9XpOv97cMAj2doxpQD1T+1MN/RtaBkmJA1VIV2Rdat8jL1IejfnmRqP3zMT/80tx
         tFsQ==
X-Gm-Message-State: AOJu0Yy1e/AGTx+QD4dlpaYj3u/u3h0G2TbsldtBthPZVSQKVEomnsoG
	IOKlPNszr6iheP0bi81nKwO0RTJWeXJVG6ZS
X-Google-Smtp-Source: AGHT+IF2wDEBj0GwG1tqdYCkwlI/Dr/TpovV0kNgMqI8W7WvtGpza2dfTWaW5yDPUPQo5DtLsFyBKQ==
X-Received: by 2002:a7b:c5cd:0:b0:40c:30fb:60ab with SMTP id n13-20020a7bc5cd000000b0040c30fb60abmr1263494wmk.134.1704454580751;
        Fri, 05 Jan 2024 03:36:20 -0800 (PST)
Received: from infinity.. ([156.213.196.64])
        by smtp.googlemail.com with ESMTPSA id v11-20020a05600c444b00b0040d8390b199sm1300966wmn.12.2024.01.05.03.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 03:36:20 -0800 (PST)
From: Reda Maher <eng.redamaher@gmail.com>
To: devicetree-spec@vger.kernel.org
Cc: Reda Maher <eng.redamaher@gmail.com>
Subject: [PATCH] Fixing some typos and adding missing dots, commas, and hyphens
Date: Fri,  5 Jan 2024 13:35:09 +0200
Message-Id: <20240105113509.4132-1-eng.redamaher@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree-spec@vger.kernel.org
List-Id: <devicetree-spec.vger.kernel.org>
List-Subscribe: <mailto:devicetree-spec+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree-spec+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Reda Maher <eng.redamaher@gmail.com>
---
 source/chapter2-devicetree-basics.rst |  6 ++---
 source/chapter3-devicenodes.rst       | 10 ++++----
 source/chapter4-device-bindings.rst   | 34 +++++++++++++--------------
 source/chapter5-flattened-format.rst  |  8 +++----
 4 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/source/chapter2-devicetree-basics.rst b/source/chapter2-devicetree-basics.rst
index 5ab9e6e..ef3abca 100644
--- a/source/chapter2-devicetree-basics.rst
+++ b/source/chapter2-devicetree-basics.rst
@@ -50,7 +50,7 @@ of its scan, for passing to the Operating System.
 :numref:`example-simple-devicetree` shows an example representation of a
 simple devicetree that is nearly
 complete enough to boot a simple operating system, with the platform
-type, CPU, memory and a single UART described. Device nodes are shown
+type, CPU, memory, and a single UART described. Device nodes are shown
 with properties and values inside each node.
 
 .. _example-simple-devicetree:
@@ -487,7 +487,7 @@ Description:
    The *compatible* property value consists of one or more strings that
    define the specific programming model for the device. This list of
    strings should be used by a client program for device driver selection.
-   The property value consists of a concatenated list of null terminated
+   The property value consists of a concatenated list of null-terminated
    strings, from most specific to most general. They allow a device to
    express its compatibility with a family of similar devices, potentially
    allowing a single device driver to match against several devices.
@@ -497,7 +497,7 @@ Description:
    (such as a stock ticker symbol), and ``model`` specifies the model
    number.
 
-   The compatible string should consist only of lowercase letters, digits and
+   The compatible string should consist only of lowercase letters, digits, and
    dashes, and should start with a letter. A single comma is typically only
    used following a vendor prefix. Underscores should not be used.
 
diff --git a/source/chapter3-devicenodes.rst b/source/chapter3-devicenodes.rst
index 958257e..5610a78 100644
--- a/source/chapter3-devicenodes.rst
+++ b/source/chapter3-devicenodes.rst
@@ -81,7 +81,7 @@ specifies the alias name. The property value specifies the full path to
 a node in the devicetree. For example, the property serial0 =
 ``"/simple-bus@fe000000/serial@llc500"`` defines the alias ``serial0``.
 
-Alias names shall be a lowercase text strings of 1 to 31 characters from
+Alias names shall be lowercase text strings of 1 to 31 characters from
 the following set of characters.
 
 .. tabularcolumns:: | c p{8cm} |
@@ -582,7 +582,7 @@ standard properties with specific applicable detail.
                                                    If a CPU/thread cannot be the target of an
                                                    external interrupt, then *reg* must be unique
                                                    and out of bounds of the range addressed by
-                                                   the interrupt controller
+                                                   the interrupt controller.
 
                                                    If a CPU/thread's PIR (pending interrupt register)
                                                    is modifiable, a client
@@ -811,12 +811,12 @@ The following properties of a cpu node describe the processor’s internal
                                                (combined instructions and data).
    ``cache-sets``          SD    ``<u32>``     Specifies the number of associativity sets in
                                                a unified cache. Required if the cache is
-                                               unified (combined instructions and data)
+                                               unified (combined instructions and data).
    ``cache-block-size``    SD    ``<u32>``     Specifies the block size in bytes of a unified
                                                cache. Required if the processor has a unified
-                                               cache (combined instructions and data)
+                                               cache (combined instructions and data).
    ``cache-line-size``     SD    ``<u32>``     Specifies the line size in bytes of a unified
-                                               cache, if different than the cache block size
+                                               cache, if different than the cache block size.
                                                Required if the processor has a unified cache
                                                (combined instructions and data).
    ``i-cache-size``        SD    ``<u32>``     Specifies the size in bytes of the instruction
diff --git a/source/chapter4-device-bindings.rst b/source/chapter4-device-bindings.rst
index 02a8fa0..3d93a67 100644
--- a/source/chapter4-device-bindings.rst
+++ b/source/chapter4-device-bindings.rst
@@ -10,7 +10,7 @@ types and classes of devices are represented in the devicetree. The
 compatible property of a device node describes the specific binding (or
 bindings) to which the node complies.
 
-Bindings may be defined as extensions of other each. For example a new
+Bindings may be defined as extensions of each other. For example, a new
 bus type could be defined as an extension of the simple-bus binding. In
 this case, the compatible property would contain several strings
 identifying each binding—from the most specific to the most general (see
@@ -75,10 +75,10 @@ here to facilitate standardization of names and usage.
                ``<prop-encoded-array>`` in one of two forms:
 
                a 32-bit integer consisting of one ``<u32>`` specifying the
-               frequency
+               frequency.
 
                a 64-bit integer represented as a ``<u64>`` specifying the
-               frequency
+               frequency.
    =========== ==============================================================
 
 ``reg-shift`` Property
@@ -115,7 +115,7 @@ here to facilitate standardization of names and usage.
    Property    ``label``
    =========== ==============================================================
    Value type  ``<string>``
-   Description The label property defines a human readable string describing
+   Description The label property defines a human-readable string describing
                a device. The binding for a given device specifies the exact
                meaning of the property for that device.
    =========== ==============================================================
@@ -126,10 +126,10 @@ Serial devices
 Serial Class Binding
 ~~~~~~~~~~~~~~~~~~~~
 
-The class of serial devices consists of various types of point to point
+The class of serial devices consists of various types of point-to-point
 serial line devices. Examples of serial line devices include the 8250
-UART, 16550 UART, HDLC device, and BISYNC device. In most cases hardware
-compatible with the RS-232 standard fit into the serial device class.
+UART, 16550 UART, HDLC device, and BISYNC device. In most cases, hardware
+compatible with the RS-232 standard fits into the serial device class.
 
 I\ :sup:`2`\ C and SPI (Serial Peripheral Interface) devices shall not
 be represented as serial port devices because they have their own
@@ -181,12 +181,12 @@ the devicetree using following properties.
    ======================= ===== ===================== ===============================================
    ``compatible``          R     <string list>         Value shall include "ns16550".
    ``clock-frequency``     R     ``<u32>``             Specifies the frequency (in Hz) of the baud
-                                                       rate generator’s input clock
+                                                       rate generator’s input clock.
    ``current-speed``       OR    ``<u32>``             Specifies current serial device speed in bits
-                                                       per second
+                                                       per second.
    ``reg``                 R     ``<prop encoded       Specifies the physical address of the
                                  array>``              registers device within the address space of
-                                                       the parent bus
+                                                       the parent bus.
    ``interrupts``          OR    ``<prop encoded       Specifies the interrupts generated by this
                                  array>``              device. The value of the interrupts property
                                                        consists of one or more interrupt specifiers.
@@ -248,7 +248,7 @@ Network Class Binding
    =========== ==============================================================
    Property    ``local-mac-address``
    =========== ==============================================================
-   Value type  ``<prop-encoded-array>`` encoded as an array of hex numbers
+   Value type  ``<prop-encoded-array>`` encoded as an array of hex numbers.
    Description Specifies MAC address that was assigned to the network device
                described by the node containing this property.
    Example     ``local-mac-address = [ 00 00 12 34 56 78 ];``
@@ -263,7 +263,7 @@ Network Class Binding
    =========== ==============================================================
    Property    ``mac-address``
    =========== ==============================================================
-   Value type  ``<prop-encoded-array>`` encoded as an array of hex numbers
+   Value type  ``<prop-encoded-array>`` encoded as an array of hex numbers.
    Description Specifies the MAC address that was last used by the boot
                program. This property should be used in cases where the MAC
                address assigned to the device by the boot program is
@@ -368,8 +368,8 @@ the network device class.
    Value type  ``<phandle>``
    Description Specifies a reference to a node representing a physical layer
                (PHY) device connected to this Ethernet device. This property
-               is required in case where the Ethernet device is connected a
-               physical layer device.
+               is required in case where the Ethernet device is connected to
+               a physical layer device.
    Example     ``phy-handle = <&PHY0>;``
    =========== ==============================================================
 
@@ -402,11 +402,11 @@ specifiers:
    ======================== ===== ===================== ===============================================
    Property Name            Usage Value Type            Definition
    ======================== ===== ===================== ===============================================
-   ``compatible``           R     ``<string>``          Value shall include ``"open-pic"``
+   ``compatible``           R     ``<string>``          Value shall include ``"open-pic"``.
    ``reg``                  R     ``<prop encoded       Specifies the physical address of the
                                   array>``              registers device within the address space of
-                                                        the parent bus
-   ``interrupt-controller`` R     ``<empty>``           Specifies that this node is an interrupt controller
+                                                        the parent bus.
+   ``interrupt-controller`` R     ``<empty>``           Specifies that this node is an interrupt controller.
    ``#interrupt-cells``     R     ``<u32>``             Shall be 2.
    ``#address-cells``       R     ``<u32>``             Shall be 0.
    Usage legend: R=Required, O=Optional, OR=Optional but Recommended, SD=See Definition
diff --git a/source/chapter5-flattened-format.rst b/source/chapter5-flattened-format.rst
index c7f7a48..03d1217 100644
--- a/source/chapter5-flattened-format.rst
+++ b/source/chapter5-flattened-format.rst
@@ -6,7 +6,7 @@ Flattened Devicetree (DTB) Format
 ==================================
 
 The Devicetree Blob (DTB) format is a flat binary encoding of devicetree data.
-It used to exchange devicetree data between software programs.
+It is used to exchange devicetree data between software programs.
 For example, when booting an operating system, firmware will pass a DTB to the OS kernel.
 
 .. note::
@@ -60,10 +60,10 @@ the original definition of the format. Fields in the header give the version,
 so that the client program can determine if the devicetree is encoded in a
 compatible format.
 
-This document describes only version 17 of the format. |spec| compliant boot
+This document describes only version 17 of the format. |spec|-compliant boot
 programs shall provide a devicetree of version 17 or later, and should provide
 a devicetree of a version that is backwards compatible with version 16.
-|spec| compliant client programs shall accept devicetrees of any version
+|spec|-compliant client programs shall accept devicetrees of any version
 backwards compatible with version 17 and may accept other versions as well.
 
 .. note:: The version is with respect to the binary structure of the device
@@ -408,7 +408,7 @@ shall have aligned offsets from the beginning of the devicetree blob.
 To ensure the in-memory alignment of the blocks, it is sufficient to
 ensure that the devicetree as a whole is loaded at an address aligned
 to the largest alignment of any of the subblocks, that is, to an 8-byte
-boundary. A |spec| compliant boot
+boundary. A |spec|-compliant boot
 program shall load the devicetree blob at such an aligned address
 before passing it to the client program. If an |spec| client program
 relocates the devicetree blob in memory, it should only do so to
-- 
2.34.1

