From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Node names and properties names collision
Date: Thu, 12 May 2016 09:40:21 +0200
Message-ID: <57343365.6080000@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:organization:message-id:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=OqUADlb7n0xVozOcAei6au+WumNZqRDF3SHCbU3nwkE=;
        b=PhSZDVA1jIwj+KGoQT6ptPQt8+TrsTu4IPxuRZWYpDx7ScvOSV6FQ08PoVKb7eFKNr
         gILEMpxo2KhFQ0zsNp9pUbXLT4P/p1n3lQ3PcJ+nLil0QuaIrcmPjB+XFVNIngkV2BZY
         WXOkgmUdgdhDy2KtjlYTIdj+1QZFN5g7OAT76dTr/o6wzEazMFwT4zCx83CFQf9zw/n+
         HWx2z2V7dmp2KGB8LRHCjFz7mxESWO0Tbdi9IUquiMtFhhj01wkcckp02m40O3xDwrtj
         /ANkgUuVS8EekYo0YtgYHTgZCHUgrEtbEEybnoReeGI6tI0NgBlqhF0hSDMCd+NLIntf
         g9WQ==
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-ID: <devicetree-spec.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Hi,

I'm working on a full python device tree library to load blobs and manipulate the tree in-memory as an object tree (http://github.com/superna9999/pyfdt).
My testsuite strategy was to run the DTC testsuite and load every DTC generated dtbs, re-generate a DTS and compare the DTC dtb-to-dts output.

But I have a strange case using the Amlogic out-of-tree BSP dts where they use the same name for a sub-node and a property :

	efusekey:efusekey{
		keynum = <4>;
		key0 = <&key0>;
		key1 = <&key1>;
		key2 = <&key2>;
		key3 = <&key3>;
		key0:key0{
			keyname = "mac";
			offset = <0>;
			size = <6>;
		};
		key1:key1{
			keyname = "mac_bt";
			offset = <6>;
			size = <6>;
		};
		key2:key2{
			keyname = "mac_wifi";
			offset = <12>;
			size = <6>;
		};
		key3:key3{
			keyname = "usid";
			offset = <18>;
			size = <16>;
		};
	};

While reading the original ePAPR and the new linaro specifications, I was not able to find an answer....

Is it authorized ? Could this be clarified in the new specifications ?

Neil
